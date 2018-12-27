function x = circular_mirror_one_pt(uq, r2, phi2, r_range, phi_range, b, k, wvl)
    matrix = zeros(length(phi_range), length(r_range));
    
    for phi_i = 1:length(phi_range)
        for r_i = 1:length(r_range)
            r1 = r_range(r_i);
            phi1 = phi_range(phi_i);

            R = sqrt(b^2 + r1^2 + r2^2 - 2*r1*r2*cos(phi1-phi2));
         %   disp(imag(b1))
            value = (1j/(2*wvl)) * uq(phi_i, r_i) * exp(-1j*k*R) * (1+b/R) * r1 / R;
            matrix(phi_i, r_i) = value;
        end
    end

    partial_sums = zeros(1, length(r_range));
    for row = 1:length(phi_range)
        partial_sums(row) = trapz(r_range, matrix(row, :));
    end
    
    x = trapz(phi_range, partial_sums);
    
end
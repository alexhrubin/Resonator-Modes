function x = spherical_mirror_one_pt(uq, r2, phi2, r_range, phi_range, m_r, b, k, wvl)
    matrix = zeros(length(phi_range), length(r_range));
    
    for phi_i = 1:length(phi_range)
        for r_i = 1:length(r_range)
            r1 = r_range(r_i);
            phi1 = phi_range(phi_i);

            if m_r == 0 %indicating a flat mirror
                delta1 = 0;
                delta2 = 0;
            else
                delta1 = b-sqrt(m_r^2-r1^2); % (r1^2)/(2*b);
                delta2 = 0; %b-sqrt(m_r^2-r2^2); % (r2^2)/(2*b);
            end
            
            b1 = b - delta1 - delta2;
            R = sqrt(b1^2 + r1^2 + r2^2 - 2*r1*r2*cos(phi1-phi2));
            
            value = (1j/(2*wvl)) * uq(phi_i, r_i) * exp(-1j*k*R) * (1+b1/R) * r1 / R;
            matrix(phi_i, r_i) = value;
        end
    end

    partial_sums = zeros(1, length(r_range));
    for row = 1:length(phi_range)
        partial_sums(row) = trapz(r_range, matrix(row, :));
    end
    
    x = trapz(phi_range, partial_sums);
    
end
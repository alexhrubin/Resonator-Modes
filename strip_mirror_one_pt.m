function x = strip_mirror_one_pt(uq, x2, a_range, b, k, wvl)
    accumulator = zeros(1, length(a_range));
    for i = 1:length(uq)
        x1 = a_range(i);
        rho = sqrt(b^2 + (x1-x2)^2);
        value = (exp(1j*pi/4)/sqrt(wvl)) * uq(i) * exp(-1j*k*rho) * (1+b/rho) / sqrt(rho);
        accumulator(i) = value;
    end
    x = trapz(accumulator);
end
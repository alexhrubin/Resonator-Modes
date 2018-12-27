function x = separate(uq, r_range, phi_range)
    r_len = length(r_range);
    phi_len = length(phi_range);
    
    separated = zeros(r_len*phi_len, 3);
    
    for r_i = 1:length(r_range)
        for phi_i = 1:length(phi_range)
            idx = (r_i-1)*phi_len + phi_i;
            separated(idx, :) = [r_range(r_i), phi_range(phi_i), uq(phi_i, r_i)];
        end
    end
    
    x = separated;
end
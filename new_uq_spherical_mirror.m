function x = new_uq_spherical_mirror(prev_uq, r_range, phi_range, m_r, b, k, wvl)
    new_uq = zeros(length(phi_range), length(r_range));
    
    for phi_i = 1:length(phi_range)
        for r_i = 1:length(r_range)
            new_uq(phi_i, r_i) = spherical_mirror_one_pt(prev_uq, r_range(r_i), phi_range(phi_i), r_range, phi_range, m_r, b, k, wvl);
        end
    end
    x = new_uq; % / max(max(new_uq));
end

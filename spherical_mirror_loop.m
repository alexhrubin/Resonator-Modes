function x = spherical_mirror_loop(num_iterations, r_range, phi_range, m_r, b, k, wvl)
    prev_uq = ones(length(phi_range), length(r_range));
    for i = 1:num_iterations
        new = new_uq_spherical_mirror(prev_uq, r_range, phi_range, m_r, b, k, wvl);
        prev_uq = new;
    end
    x = new;
end
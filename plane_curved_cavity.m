function x = plane_curved_cavity(num_iterations, r_range, phi_range, m_r, b, k, wvl)
    prev_uq = ones(length(phi_range), length(r_range));
    
    curved_r_range = linspace(1e-12, 1e-2, 20);
    flat_r_range = linspace(1e-12, 9e-4, 20);
    
    for i = 1:num_iterations
        new_uq = new_uq_spherical_mirror(prev_uq, r_range, phi_range, m_r, b, k, wvl);
        new_uq = new_uq_spherical_mirror(new_uq, r_range, phi_range, 0, b, k, wvl);
        prev_uq = new_uq / max(max(abs(new_uq)));
    end
    x = prev_uq;

end
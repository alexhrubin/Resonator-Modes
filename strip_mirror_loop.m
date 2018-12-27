function x = strip_mirror_loop(num_iterations, a_range, b, k, wvl)
    prev_uq = ones(1, length(a_range));
    record = zeros(num_iterations, length(a_range));
    
   % eig = fredholm_solver(a_range(1), a_range(end), 1000, b);
    
    for i = 1:num_iterations
        record(i,:) = prev_uq;
        new = arrayfun(@(z) strip_mirror_one_pt(prev_uq, z, a_range, b, k, wvl), a_range);
        prev_uq = new / max(new);
    end
    record(num_iterations, :) = prev_uq;
    x = record;
end
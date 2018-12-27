function x = fredholm_solver(a, a1, n, b)
    m = zeros(n, n);
    dt = (a1-a)/n;
    
    xtrange = linspace(a,a1,n);
    
    for i = 1:n
        for j = 1:n
            x = xtrange(i);
            t = xtrange(j);
            Kij = strip_mirror_kernel(x, t, b);
            pre = dt;
            if (j==0) || (j==n)
                pre = pre/2;
            end
            
            m(i,j) = pre * Kij;
            
        end
    end
    x = eig(m);
end


function x = strip_mirror_kernel(x1, x2, b)
    wvl = 10.6e-6;
    k = 2*pi/wvl;
  %  b = 625 * wvl;
    rho = sqrt(b^2 + (x1-x2)^2);
    value = (exp(1j*pi/4)/sqrt(wvl)) * exp(-1j*k*rho) * (1+b/rho) / sqrt(rho);
    x = value;
end
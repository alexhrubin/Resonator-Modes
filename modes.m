wvl = 10.6e-6;
min_ap = 0.9e-3; %meters
tube_len = 0.787; %meters
a = min_ap/2; %25 * wvl;
b = tube_len; %625 * wvl;
N = a^2 / (b*wvl);

a_range = linspace(-a, a, 500);
r_range = linspace(1e-12, a, 20);
phi_range = linspace(0, 2*pi, 20);

l = strip_mirror_loop(30, a_range, b, k, wvl);
amplitudes = abs(l);
phases = angle(l);

for i = 1:30
plot(amplitudes(i,:)/max(amplitudes(i,:)))
hold on
end

t2 = [0, 0.5, 2, 2, 2.2, 2.5, 3, 4];
t = [0, 0.5, 2, 2, 2, 2.5, 3, 4];
f = @(x) max(0, 4 - x.^2);
R=50;
k=3;
x = linspace(0, 4, 400);
% plot(x, f(x));
t_samenvallend = [0, 1, 2, 2, 2, 3, 4];
t_niet_samenvallend = [0, 1, 2, 2.1, 2.2, 3, 4];
plot_kkb_spline(t_niet_samenvallend, f, R, k)

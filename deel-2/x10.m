
function x10(t)
load("/home/pjuithetbos/Documents/ir/nmbtd/practicum1/exercise10.mat")
xplot = (0:0.05:1);
ans2 = kkb_spline(t, x, y, xplot, 3);
hold off
scatter(x, y)
plot(xplot, ans2)
scatter(x, y)
hold on
plot(xplot, ans2)
scatter(t, zeros(size(t)), 'r', 'o', 'LineWidth',3)
xlabel("Benaderingsinterval [0, 1]")
ylabel("Functiewaarden")
legend("data", "splinebenadering", "knooppunten")
hold off


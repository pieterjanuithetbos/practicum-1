
function opgave11
load("/home/pjuithetbos/git/practicum-1/exercise10.mat")
t = t1;
xplot = (0:0.05:1);
ans2 = kkb_spline(t, x, y, xplot, 3);
hold off
scatter(x, y)
plot(xplot, ans2)
scatter(x, y)
hold on
plot(xplot, ans2)
scatter(t, zeros(size(t)), 'r', 'o', 'LineWidth',3)
xlabel("Benaderingsinterval [0, 1]", 'FontSize', 14)
ylabel("Functiewaarden", 'FontSize', 14)
legend("data", "splinebenadering", "knooppunten", 'FontSize', 14)
hold off


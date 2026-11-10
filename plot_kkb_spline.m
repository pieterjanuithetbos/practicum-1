function plot_kkb_spline(t, functie, R, k)
% INVOER
% t: knooppunten [t_0, ..., t_n]
% functie: function handle van functie die we willen benaderen
% R: aantal samples 
% benaderingsinterval wordt hier gelijk genomen aan [t(k+1), t(k+n+1)]
% UITVOER
% figuur die b en f plot

n = length(t) - 2*k - 1;
t_0 = t(1);
t_n = t(end);
t = maak_knooppuntenrij(t, k, 0.5);

%%% sample functiewaarden
x = linspace(t_0, t_n, R);
f = functie(x);

%%% bereken kkb_splinebenadering
xplot = linspace(t_0, t_n, 100);
b = kkb_spline(t, x, f, xplot, k);

%%% plot resultaat
scatter(x, f);
hold on 
plot(xplot, b)
% scatter(t, zeros(size(t)), 'o', 'LineWidth',2)
legend('discrete data', 'kkb splinebenadering')
xlabel(sprintf('Benaderingsinterval [%d,%d], k = %d', t_0, t_n, k))
ylabel('Functiewaarde')
hold off
end
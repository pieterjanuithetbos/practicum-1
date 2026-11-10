function res = maak_knooppuntenrij(t, k, interval)
% INVOER 
% t: knooppunten binnen het benaderingsinterval
% k: graad van splinebenadering
% interval: grootte van het inverval waarmee knooppunten toegevoegd worden
% UITVOER
% k: t aangevuld tot n + 2*k + 1 knooppunten, 
% door links en rechts equidistant k knooppunten toe te voegen

n = length(t) - 1;
res = zeros(1, n+2*k+1);

res(k+1:n+k+1) = t;
links = t(1) + (-k*interval:interval:-interval);
rechts = t(end) + (interval:interval:k*interval);
res(1:k) = links;
res(n+k+2:end) = rechts;
end



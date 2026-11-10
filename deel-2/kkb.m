function Z = kkb_spline(t, x, f, xplot, k)
% INVOER
% t: een kolomvector van lengte n + 2k + 1 die de knooppuntenrij voorstelt. 
% x: een kolomvector van lengte R die de abscissen bevat 
% waarin de gegeven functie f wordt geëvalueerd.
% f: een kolomvector van lengte R, die de functiewaarden horende bij x bevat.
% xplot: een rijvector van lengte N die de punten bevat waarin we de splinefunctie willen evalueren.
% k: de graad van de spline benadering.
% 
% UITVOER
% Z: functiewaarden in de punten xplot.

n = length(t) - 2*k - 1;
R = length(x);
%%% stel M op
M = zeros(R, n+k);
for i=1:n+k
    select_one = zeros(1, n+k);
    select_one(i) = 1; % selecteer de spline startend in knoop -k+(i-1)
    % evalueer kolom i in alle abscissen
    M(:,i) = deboor(k, t, select_one, x);
end

c = M\f;
% evalueer de splines van graad k voor de gegeven knooppunten 
% in alle punten xplot
Z = deboor(k, t, c, xplot); 
end
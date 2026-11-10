function s = deboor(k, t, c, x)
% INVOER:
%  k: graad van de spline
%  t: knooppunten (n+2*k+1)
%  c: coefficienten (n+k)
%  x: abscissen waar men de spline wenst te evalueren
%
% UITVOER:
%  s: waarde van de spline

s = zeros(size(x));
for in=1:length(x)

    % Bepaal het interval waarin x ligt
    if abs(x(in)-t(length(t)-k)) < 1e-10
        % Geval x=b
        j=length(t)-2*k-2; % j = n-1
    else 
        j=max(find(x(in)>=(t-1e-12)))-k-1;
    end
    
    % j kan van -k tot n-1 gaan, omzetten naar matlab: j+k+1
    % c_{j-k} staat op positie 1 (MATLAB indexeert vanaf 1)
    d=c(j-k+k+1:j+k+1); % niet-nul splines gaan van index j-k tem j

    for r=1:k % reis door heel de boom (in ---> richting)
        for i=j:-1:j-k+r % reis door heel de boom (in 
                         %          ^
                         %          |
                         %          |   richting)
            idx = i+k+1; % bereken MATLAB-index voor berekeningen in t en x
            alfa = (x(in) - t(idx)) / (t(idx+k+1-r)-t(idx));
            % in eerste iteratie is idx-j = k+1
            % in laatste iteratie is idx-j = 1+r
            d(idx-j) = alfa*d(idx-j) + (1-alfa)*d(idx-j-1);
            % c_j overschrijft zichzelf in laatste iteratie
        end
    end
    s(in) = d(k+1);
end

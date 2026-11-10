function visualiseer_spline_basis(t)
    % INVOER:
    %  t: knooppunten (n+1), waarvan de eerste 0 is

    % UITVOER
    % plot de splinebasis in [0, 1]

    n = length(t) - 1; % n is aantal intervallen
    k = 3;
    N = 100;
    
    % normaliseer knooppunten
    if t(end) > 1
        t = t / t(end);
    end
    
    % voeg extra knooppunten toe
    ext_t = zeros(1, n+2*k+1); 
    ext_t(k+1:n+k+1) = t; % kopieer t
    ext_t(1:k) = 1/k* (-k:-1); % vul aan met k abscissen < 0
    ext_t(n+k+2:end) = 1 + 1/k * (1:k); % vul aan met k abscissen > 1

    labels = cell(1, n+k); % houdt bij welke N geplot wordt
    all_samples = zeros(1, N);
    
    % sample punten en evalueer basisfuncties
    for i=1:n+k
        abscissen = linspace(0, 1, N);
        samples = zeros(1, N);
        c = zeros(1, n+k);
        % selecteer de i-de basisfunctie
        c(i) = 1;
        for j = 1:N
            samples(j) = deboor(k, ext_t, c, abscissen(j));
            all_samples(j) = all_samples(j) + samples(j);
        end
   
        plot(abscissen, samples);
        % title('Splinebasis in [0, 1]')
        labels{i} = sprintf('N_{%d,%d}', -k-1+i, k+1);
        hold on;
    end
    legend(labels)
    xlabel("Benaderingsinterval [0, 1]")
    ylabel("B-splinefunctie")

    % print extra info en controles
    disp(ext_t)
    disp(all_samples - ones(1, N))
end

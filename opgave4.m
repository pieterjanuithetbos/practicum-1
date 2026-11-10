%Opgave3
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
m=200;
n=100;

B=randn(m,n);
[Q, R]=qr(B,"econ");

D=zeros(n,n);
for i=1:n
    D(i,i)=2^(1-i);
end

V=eye(n);
for i=1:n
    V(1,i)=1;
end

A=Q*D*V;

%aj=qj*2^(1-j)
%aj=qj*2^(1-j)-q1 voor j=2:n
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Opgave4
[Qkl, Rkl]=klGS(A);
[Qmod, Rmod]=modGS(A);



n = size(Q,2);

% 2-norm van het verschil per kolom
fout_kl  = vecnorm(Qkl  - Q, 2, 1);
fout_mod = vecnorm(Qmod - Q, 2, 1);

figure;
semilogy(1:n, fout_kl,  'o-', 'LineWidth', 1.2); hold on;
semilogy(1:n, fout_mod, 's-', 'LineWidth', 1.2);
j = 2:n;
theo_kl  = 2.^(2*j-3) * eps;   % klassiek:  2^(2j-3) * eps_mach
theo_mod = 2.^(j-1)   * eps;   % aangepast: 2^(j-1)   * eps_mach

theo_kl(theo_kl > 1)   = NaN;
theo_mod(theo_mod > 1) = NaN;

semilogy(j, theo_kl,  '--', 'Color', [0 0.6 0],   'LineWidth', 2);   % donkergroen
semilogy(j, theo_mod, ':',  'Color', [0.2 0.8 0.2], 'LineWidth', 2.5); % lichtgroen


grid on;
ax = gca;
ax.FontSize = 20;
ax.YLabel.FontSize = 20;
xlabel('$j$', 'Interpreter', 'latex','FontSize',35);
ylabel('$\|\tilde{q}_j - q_j\|_2$', 'Interpreter', 'latex', 'FontSize', 35);
legend('klassieke GS: $\|\tilde{q}_j - q_j\|_2$', 'aangepaste GS: $\|\tilde{q}_j - q_j\|_2$', ...
       'klassieke GS (theorie)', 'aangepaste GS (theorie)', ...
       'Interpreter', 'latex', 'Location', 'southeast', 'FontSize', 30);
%Fout voor j=1 is 0, en dit kan niet worden weergegeven op log plot


%Waarom het er zo uitziet: %a1=q1
                           %aj=qj*2^(1-j)-q1 voor j=2:n
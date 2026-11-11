load model.mat      
load validate.mat   

nmax = 31;
E_model = zeros(1, nmax);
E_val   = zeros(1, nmax);

for n = 1:nmax
    m = length(u_model);
    % A heeft een toeplitz structuur
    A = toeplitz(u_model(n:m), u_model(n:-1:1));
    b = y_model(n:m);
    [Q, R] = modGS(A); % gebruik gewijzigde GS
    x = R \ (Q' * b);
    E_model(n) = norm(A*x - b);

    % valideren
    mv = length(u_validate);
    Av = toeplitz(u_validate(n:mv), u_validate(n:-1:1));
    bv = y_validate(n:mv);
    E_val(n) = norm(Av*x - bv);
end

semilogy(1:nmax, E_model/sqrt(m), '-o', 1:nmax, E_val/sqrt(mv), '-s')
legend('modeldata', 'validatiedata', 'FontSize',  16)
xlabel('n (aantal tijdsvertragingen + 1)', 'FontSize',  16), ylabel('$\| Ax - b \|_2 / \sqrt{m-n+1}$', 'Interpreter', 'latex', 'FontSize',  16)
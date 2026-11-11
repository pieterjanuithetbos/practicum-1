m = randi([15,20]);
n = randi([8,13]);
A = randn(m,n);


[Q,R] = klGS(A);
checkQR(A,Q,R,'klGS');

[Q,R] = modGS(A);
checkQR(A,Q,R,'modGS');

[Q,R] = herGS(A);
checkQR(A,Q,R,'herGS');


% Hulpfunctie om de QR-factorisatie te controleren
function checkQR(A,Q,R,name)

    tol = 1e-10;
    n = size(A,2);

    fout1 = norm(A-Q*R,'fro') / norm(A, 'fro');
    fout2 = norm(Q'*Q-eye(n),'fro');
    fout3 = norm(tril(R,-1),'fro') / norm(R,'fro');

    fprintf('\nTests voor %s:\n', name);
    fprintf('Norm A-QR:   %e\n', fout1);
    fprintf("Norm Q'*Q-I: %e\n", fout2);
    fprintf('R bovendriehoeksmatrix?: %e\n', fout3);

    assert(fout1 < tol, 'Norm A-QR te groot');
    assert(fout2 < tol, "Q'*Q-I is te groot");
    assert(fout3 < tol, 'R is niet bovendriehoeksmatrix!');

    fprintf('Alle tests geslaagd!\n');
end
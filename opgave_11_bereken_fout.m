function fout = opgave_11_bereken_fout
load("/home/pjuithetbos/git/practicum-1/exercise10.mat")
t = t2;
fit = kkb_spline(t, x, y, x, 3);
scatter(x, fit)
hold on
scatter(x, y)
hold off
disp(fit)
disp(y)
disp(length(y))
fout = norm(y-fit);
end

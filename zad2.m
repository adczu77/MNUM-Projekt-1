clear;
clc;
nv = [5; 10; 25; 50; 100; 200];
w = size(nv,1);
EPSa = zeros(w, 1);
t = zeros(w,1);
eps2w = 1e-6;
for i=1:size(nv)
    [A, ba] = gen_A_test(nv(i,1));
    tic
    [~, EPS1] = jacobi(A, ba, eps2w);
    t(i,1) = toc;
    EPSa(i,1) = EPS1;
end
plot(nv, EPSa, 'o-', 'MarkerFaceColor','blue');
xlabel('Liczba równań (n)')
ylabel('Błąd ε1')
grid("on")
legend("Macierz z przykładu A)");
disp(t);

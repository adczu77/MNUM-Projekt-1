clear;
clc;
nv = [5; 10; 25; 50; 100; 200];
w = size(nv,1);
EPSa = zeros(w, 1);
EPSb = zeros(w, 1);
t = zeros(w,2);
for i=1:size(nv)
    [A, ba] = gen_A_test(nv(i,1));
    [B, bb] = gen_B_test(nv(i,1));
    tic
    [~, EPS1] = pgauss(A, ba);
    t(i,1) = toc;
    EPSa(i,1) = EPS1;
    tic
    [~, EPS2] = pgauss(B, bb);
    t(i,2) = toc;
    EPSb(i,1) = EPS2;
end
plot(nv, EPSa, 'o-', 'MarkerFaceColor','blue');
hold on
plot(nv, EPSb, 'o-', 'MarkerFaceColor','red');
legend("Macierz z przykładu A)", "Macierz z przykładu B)");
xlabel('Liczba równań (n)');
ylabel('Błąd ε1');
grid("on");
disp(t);
% Definicja procedury, jej parametrów wejściowych i wejściowych:
function [x, eps1] = jacobi(A, b, eps2w)
% Utworzenie zmiennych:
%   -w - oznaczającą liczbę wierszy macierzy rozszerzonej,
%   -k - oznaczającą liczbę kolumn macierzy rozszerzonej,
%   -x - oznaczający wektor rozwiązań w danej iteracji:
n = size(A);
w = n(1);
k = n(2);
x = zeros(w,1);
% Rozpoczęcie iteracji:
while true
    % Utworzenie wektora do którego będziemy zapisywać rozwiązanie powstałe
    % w danej iteracji, ale tylko tymczasowo w celu uniknięcia nadpisania
    % składowych wektora x:
    y = zeros(w,1);
    % Iteracja, w której liczymy każdą składową wektora rozwiązań:
    for i=1:w
        s = 0;
        for j=1:k
            if j ~= i
                s = s + A(i,j) * x(j,1);
            end     
        end
        y(i,1) = (b(i,1) - s)/A(i,i);
    end
    % Obliczenie ε2:
    eps2 = norm(y - x);
    x = y;
    % Obliczenie ε1:
    eps1 = norm(A*x - b);
    % Warunek sprawdzający czy ε2 jest mniejsze od eps2w ("w" oznacza "war - 
    % tość graniczną błędu ε2). Gdy eps2 będzie mniejsze od wartości
    % podanej do zmiennej eps2w, pętla zakończy swoje działanie.
    if (eps2 <= eps2w)
        break;
    end
end
disp(x);
disp(eps1);


    
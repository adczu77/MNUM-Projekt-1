% Definicja procedury, jej parametrów wejściowych i wejściowych:
function [x, eps1] = pgauss(A, b)
% Utworzenie macierzy rozszerzonej oraz zmiennych:
%   -w - oznaczającą liczbę wierszy macierzy rozszerzonej,
%   -k - oznaczającą liczbę kolumn macierzy rozszerzonej:
Ab = [A, b];
n = size(Ab);
w = n(1);
k = n(2);
%   Sprowadzanie macierzy rozszerzonej do postaci schodkowej górnej:
for i = 1:w
    % Wybór elementu głównego i zamiana wierszy:
    a = max(abs(Ab(i:k-1, i)));
    t = find(Ab(:, i)==a);
    Ab([t i],:) = Ab([i t],:);
    % Przekształcenie danego wiersza macierzy rozszerzonej:
    for j = (i+1):w
        Ab(j, :) = Ab(j, :) - (Ab(j,i)/Ab(i,i)) * Ab(i,:);
    end
end
% Wyodrębnienie z macierzy rozszerzonej:
%   Aw - macierzy otrzymanej w wyniku przekształceń,
%   bw - wektora otrzymanego w wyniku przekształceń:
bw = Ab(:, k);
Aw = Ab(:, (1:1:k-1));
% Utworzenie zmniennej reprezentującej wektor rozwiązań x:
x = zeros(w,1);
% Wyznaczenie wektora rozwiązań stosując "back substitution":
for i = k-1:-1:1
    for j = w:-1:1
        % Wyznaczanie zmiennej skłądowej wektora rozwiązań:
        if j == i
            x(j,1) = bw(j,1) / Aw(j,j);
        end
        % Pomnożenie pozostałych elemntów w kolumnie gdzie leży dana
        % zmienna oraz odjęcie wyniku tego działania od wektora w bw, aby
        % móc łątwiej wyznaczyć pozostałe zmienne:
        if Aw(j,i) ~= 0
            bw(j,1) = bw(j,1) - x(i,1) * Aw(j,i);
        end
    end
end
% Wyliczenie błędu wektora rozwiązania:
eps1 = norm(A*x - b);
disp(x);
disp(eps1);
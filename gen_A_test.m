function [A, ba] = gen_A_test(n)
A = zeros(n);
for i=1:n
    for j=1:n
        if j == i
            A(i,j) = 10;
        elseif (j == i - 3) || (j == i + 3)
            A(i,j) = -3 + j/n;
        else
            A(i,j) = 0;
        end
    end
end
ba = zeros(n,1);
for i=1:n
    ba(i,1) = 0.5 + 2.5 * i;
end
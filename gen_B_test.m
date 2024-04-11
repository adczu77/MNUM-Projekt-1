function [B, bb] = gen_B_test(n)
B = zeros(n);
for i=1:n
    for j=1:n
        if j ~= i
            B(i,j) = 3 * (i-j) + 4;
        else
            B(i,i) = 0.25;
        end
    end
end
bb = zeros(n,1);
for i = 1:n
    bb(i,1) = 3.5 - 0.4*i;
end
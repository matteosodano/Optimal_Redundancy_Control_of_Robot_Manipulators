clear;
syms q1 q2 q3 l1 l2 l3 real;

q = [q1; q2; q3];
l = [l1; l2; l3];
ve = [10; 0];

J = Geometric_jacobian(q);
Jpinv = pinv(J);
JpinvJ = Jpinv * J;
qdot = Jpinv * ve + (eye(3)-JpinvJ) * 0.5 * l;

dqdotdq = jacobian(qdot, q);

fin = fopen('dfdq.txt', 'w');
s = size(dqdotdq);
fprintf(fin, '%s', '[');
for i=1:s(1)
    for j=1:s(2)
        fprintf(fin, '%s', dqdotdq(i, j));
        if j ~= s(2)
            fprintf(fin, '%s ', ',');
        else
            fprintf(fin, '%s ', ';');
        end
    end
    if i ~= s(1)
        fprintf(fin, '\n');
    else
        fprintf(fin, '%s ', '];');
    end
end
fclose(fin);

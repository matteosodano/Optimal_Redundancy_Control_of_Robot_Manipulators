clear;
syms q1 q2 q3 real;

q = [q1; q2; q3];

%% manipulability case
J = Geometric_jacobian(q);
w1 = (det(J * J'))^(1/2);
disp(w1);
dw1dq = jacobian(w1, [q1; q2; q3]);
display(dw1dq);

%% jointLimits case
q_min = [-180; -95; -180]*pi/180;
q_MAX = -q_min;
q_mean = (q_MAX-q_min)/2;

n = length(q);
w2 = 0;
for i=1:n
    w2 = w2 + ((q(i)-q_mean(i))/(q_MAX(i)-q_min(i)))^2;
end
w2 = -w2/(2*n);
dw2dq = simplify(jacobian(w2, q));
display(dw2dq);

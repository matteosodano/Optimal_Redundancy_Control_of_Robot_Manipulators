function [Q, Q_DOT, LAMBDA, R, HAMILTONIAN, U, W, R_des, E] = maxPontryagin(delta_t, ti, tf, qi, kappa0, ve, str)
samples = ceil((tf - ti)/delta_t + 1);        % number of samples

%% Allocation
Q = zeros(3, samples);                        % matrix of joint variables in time
Q_DOT = zeros(3, samples);                    % matrix of joint velocity in time
LAMBDA = zeros(3, samples);                   % matrix of costate in time
R = zeros(2, samples);                        % matrix of pose in time 
HAMILTONIAN = zeros(samples, 1);              % matrix of hamiltonian in time
U = zeros(3, samples);                        % matrix of arbitrary vector in time
W = zeros(samples, 1);                        % matrix of secondary cost index in time
R_des = zeros(2, samples);                    % matrix of desired pose in time

%% Initial conditions
Q(:, 1) =  qi;    
R(:, 1) = dkf(Q(:, 1));
R_des(:, 1) = R(:, 1);

J = Geometric_jacobian(Q(:, 1));
Jpinv = pinv(J);
JpinvJ = Jpinv * J;
P = eye(3)-JpinvJ;

q_dot = Jpinv * ve;
Q_DOT(:, 1) = q_dot;

lambda = 2* projection(null(P), q_dot); 
LAMBDA(:, 1) = lambda;
U(:, 1) = 0.5 * P * LAMBDA(:, 1);

W(1) = w(str, Q(:, 1));

lagrangian = kappa0*W(1) + norm(Q_DOT(:, 1));
HAMILTONIAN(1) = -lagrangian + LAMBDA(:, 1)'*Q_DOT(:, 1);
cost_index = lagrangian;

%% Algorithm
for k = 2:samples
    J = Geometric_jacobian(Q(:, k-1));
    Jpinv = pinv(J);
    JpinvJ = Jpinv * J;
    P = eye(3)-JpinvJ;
    Q(:, k) =  delta_t * (Jpinv*ve + 0.5 * P * LAMBDA(:, k-1)) + Q(:, k-1);
    Q_DOT(:, k) = (Q(:, k)-Q(:, k-1))/delta_t;
    
    DWDQ = dwdq(str, Q(:, k-1));
    DFDQ = dfdq(Q(:, k-1), LAMBDA(:, k-1));
    LAMBDA(:, k) = delta_t * (kappa0*DWDQ' + DFDQ'*(2*(Q(:, k) - Q(:, k-1))/delta_t - LAMBDA(:, k-1))) + LAMBDA(:, k-1);
    
    U(:, k) = 0.5 * P * LAMBDA(:, k);
    R(:, k) = dkf(Q(:, k));
    W(k) = w(str, Q(:, k));
    lagrangian = kappa0*W(k) + norm(Q_DOT(:, k));
    cost_index = cost_index + lagrangian;
    HAMILTONIAN(k) = -lagrangian + LAMBDA(:, k)'*Q_DOT(:, k);
    R_des(:, k) = ve*delta_t + R_des(:, k-1);
    
end

%% Check
check(R, samples, ve, ti, tf);
E = R_des - R;
display(cost_index);
end
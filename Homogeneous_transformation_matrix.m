function T03 = Homogeneous_transformation_matrix(DHTABLE)
%% DH table of parameters
DHTABLE_a = DHTABLE(1:3, 1);
DHTABLE_d = DHTABLE(1:3, 2);
DHTABLE_alpha = DHTABLE(1:3, 3);
DHTABLE_theta = DHTABLE(1:3, 4);

%% Transformation matrix
A01 = Trasformation_matrix(DHTABLE_a(1), DHTABLE_d(1), DHTABLE_alpha(1), DHTABLE_theta(1));
A12 = Trasformation_matrix(DHTABLE_a(2), DHTABLE_d(2), DHTABLE_alpha(2), DHTABLE_theta(2));
A23 = Trasformation_matrix(DHTABLE_a(3), DHTABLE_d(3), DHTABLE_alpha(3), DHTABLE_theta(3));

%% Homogeneous transformation matrix
T01 = A01;
T02 = T01 * A12;
T03 = T02 * A23;
end


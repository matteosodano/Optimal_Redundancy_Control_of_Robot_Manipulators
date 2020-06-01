function r = dkf(q)
DHTABLE = dhtable(q);
T03 = Homogeneous_transformation_matrix(DHTABLE);
r = T03(1:2,4);



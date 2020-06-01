function M = dhtableRTB(q)
DHTABLE = dhtable(q);

DHTABLE_a = DHTABLE(1:3, 1);
DHTABLE_d = DHTABLE(1:3, 2);
DHTABLE_alpha = DHTABLE(1:3, 3);
DHTABLE_theta = DHTABLE(1:3, 4);

M = [DHTABLE_theta, DHTABLE_d, DHTABLE_a, DHTABLE_alpha];
end


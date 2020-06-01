function DHTABLE = dhtable(q)
q1 = q(1);
q2 = q(2);
q3 = q(3);
a1 = 1;
a2 = 1;
a3 = 1;

DHTABLE = [a1    0    0   q1;     %a d alpha theta
           a2    0    0   q2;
           a3    0    0   q3]; 
end


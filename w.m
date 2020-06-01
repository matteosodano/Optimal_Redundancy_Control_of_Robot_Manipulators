function d = w(str, q)
d = 0;
if str == "zero"
    return
end

if str == "manipulability" || str == "both"
    J = Geometric_jacobian(q);
    d = d + sqrt(det(J*J'));
else
    if str == "jointLimits" || str == "both"
    q_min = [-180; -95; -180]*pi/180;
    q_MAX = -q_min;
    q_mean = (q_MAX-q_min)/2;
    n = length(q);
    daux = 0;
    for i=1:n
        daux = daux + ((q(i)-q_mean(i))/(q_MAX(i)-q_min(i)))^2;
    end
    daux = -daux/(2*n);
    d = d + daux;
    else
        disp("Invalid code");
    	return;
    end
end
end
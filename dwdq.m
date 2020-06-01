function M = dwdq(str, q)
q1 = q(1);
q2 = q(2);
q3 = q(3);

M = zeros(1, 3);

if str == "zero"
    return
end

if str == "manipulability" || str == "both"
    M = [0, (sin(q2 + 2*q3) + 2*sin(2*q2 + q3) + sin(2*q2) + 2*sin(2*q2 + 2*q3) - sin(q2))/(2*(cos(q2) - cos(2*q2 + q3) - cos(2*q2)/2 - cos(2*q3) - cos(2*q2 + 2*q3) - cos(q2 + 2*q3) + cos(q3) + 5/2)^(1/2)), (2*sin(q2 + 2*q3) + sin(2*q2 + q3) + 2*sin(2*q3) + 2*sin(2*q2 + 2*q3) - sin(q3))/(2*(cos(q2) - cos(2*q2 + q3) - cos(2*q2)/2 - cos(2*q3) - cos(2*q2 + 2*q3) - cos(q2 + 2*q3) + cos(q3) + 5/2)^(1/2))];
else
    if str == "jointLimits" || str == "both"
        M = M + [ -(q1 - pi)/(12*pi^2), -(108*q2 - 57*pi)/(361*pi^2), -(q3 - pi)/(12*pi^2)];
    else
        disp("Invalid code");
    	return;
    end
end
end
    
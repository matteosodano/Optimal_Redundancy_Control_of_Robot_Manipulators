function check(R, samples, ve, ti, tf)
Ri = R(:, 1);
Rf = R(:, samples);
delta_R = Rf-Ri;
desidered_delta_R = ve * (tf-ti);
error = desidered_delta_R-delta_R;
disp("With this algorithm, the error in position [m] is: ")
disp(error);
disp("and the Euclidean error in position [m] is:")
disp(norm(error));
end
List of functions and brief comment:

- animate(Q, name) [function]
Creates a video named name that display a 3R planar robot moving with the joint variables Q. Needs Robotics Toolbox by Peter Corke for execution.

- aux_qdot [script]
Generates df/dq and prints it on a file. To be run only once (see Init data).

- aux_w [script]
Generates dw/dq and prints it on display. To be run only once.

- check(R, samples, ve, ti, tf) [function]
Prints the error vector and its magnitude on display.

- dfdq(q,l) [function]
Evaluates the Jacobian matrix of f wrt q and l, where q is the joint variable vector and l is the costate vector.

- dhtable(q) [function]
Returns the table of DH parameters of the manipulator on the current joint configuration.

- dhtableRTB(q) [function]
Returns a reordered table of DH parameters of the manipulator for Robotics Toolbox by Peter Corke.

- displayGraph(fvals, delta_t, ti, tf, title_str, xlabel_str, ylabel_str, legend_str) [function]
Plots fvals from ti to tf, with step delta_t. The name of the graph is called title_str, the x axis is called xlabel_str, the y axis is called ylabel_str, and the legend is called legend_str. Latex interpreter is used.

- dkf(q) [function]
Returns the current position of the end effector.

- dwdq(str, q) [function]
Returns the gradient of the secondary cost index.

- Geometric_jacobian(q) [function]
Creates the Jacobian matrix of dkf.

- GramSchmidt(A) [function]
Returns the orthonormalization of A, where A is a basis of a vector field.

- Graphs(Q, E, delta_t, ti, tf) [function]
Plots the joint variable and error vector from ti to tf, with step delta_t.

- Homogeneous_transformation_matrix(DHTABLE) [function]
Returns the Homogeneous transformation matrix from the base frame to the end effector frame.

- Init [script]
Initializes data and launches the algorithm. It can be used to plot graphs (see Graphs) or record videos (see animate).

- maxPontryagin(delta_t, ti, tf, qi, kappa0, ve, str) [function]
Returns the matrices of joint variables, joint velocity, costate, pose, hamiltonian, arbitrary vector, secondary cost index and desired pose in time from ti to tf, with step delta_t, given the initial configuration qi, the weight kappa0, the constant end effector velocity ve and the flag string str ("zero", "manipulability", "jointLimits", "both").

- projection(E, v) [function]
Returns the projection of v onto E, where E is a basis of a vector field and v is the vector to be projected onto E.

- Trasformation_matrix(a, d, alpha, theta) [function]
Builds the transformation matrix from a set of DH parameters.

- w(str, q) [function]
Computes the value of the secondary cost index where str is the flag string.
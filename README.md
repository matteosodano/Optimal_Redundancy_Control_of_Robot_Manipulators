# Optimal Redundancy Control of Robot Manipulators
Developed by: M. Sodano, F. Roscia (2019).

Supervisor: prof. D. Iacoviello.

This project is about the optimal redundancy control of robot manipulators. This topic has been tackled by means of the Pontryagin maximum principle. Since only kinematics is considered, the optimal problem is reduced to minimal value searching in a space of as many dimensions as the degrees of redundancy. The formulation is: first to convert the redundancy resolution problem to an optimal control problem, and to obtain the optimal resolution of redundancy by using the necessary conditions of Pontryagin theory. 

A planar 3R robot manipulator, shown in the figure below, is considered. In the `media` folder, videos of the simulation described below are stored.

<p align="center"> <img src="https://user-images.githubusercontent.com/62264708/83418309-ad81d880-a423-11ea-9d65-b91d99ce724f.png" width="300"> </p>

## Application of Pontryagin Maximum Principle
The control problem is to find the optimal joint variable vector and the optimal input vector satisfying the dynamical constraint (i.e., the differential kinematics) and the boundary conditions (i.e., initial and final configurations) and maximizing a performance index defined as

<p align="center"> <img src="https://user-images.githubusercontent.com/62264708/83418873-8bd52100-a424-11ea-8d1a-abb22dc9c4ee.PNG" height="80"> </p>

where the first term of the integral accounts for a secondary cost index, and the first term aims to minimize the joint velocities.

## Performance Indices
Four different cost indices are considered.

*Case 1: no secondary cost index*. The considered performance index is 


<p align="center"> <img src="https://user-images.githubusercontent.com/62264708/83418875-8bd52100-a424-11ea-9d78-6bdc5ff86c39.PNG" height="80"> </p>

without exploiting the presence of the redundancy. The solution can be obtained in closed form by the inverse differential kinematics equation, since the pseudoinverse aims to minimize the norm of the joint velocity at each step.

*Case 2: manipulability measure as secondary cost index*. In order to have more dexterous joint variable evolution, the manipulability measure has been considered. It annihilates at singular configurations, then by maximizing it redundancy is exploited to move away from singularities.  

<p align="center"> <img src="https://user-images.githubusercontent.com/62264708/83418869-8b3c8a80-a424-11ea-8e98-2211081845c2.PNG" height="80"> </p>

*Case 3: distance from joint limits as secondary cost index*. Defining some joint limits, the maximization aims to keep the joint variables as close as possible to the center of their joint range.

<p align="center"> <img src="https://user-images.githubusercontent.com/62264708/83418871-8b3c8a80-a424-11ea-8225-a1d9707048a8.PNG" height="80"> </p>

*Case 4: hybrid secondary cost index*. The aim of this simulation is to produce the joint variables that try to minimize the norm of the joint velocities and to maximize the sum of the manipulability measure and the distance from the joint limits.

<p align="center"> <img src="https://user-images.githubusercontent.com/62264708/83418868-8aa3f400-a424-11ea-8a35-0f37bd0a815c.PNG" height="80"> </p>

## Reference
Nakamura, Y., & Hanafusa, H. (1987). Optimal redundancy control of robot manipulators. *The International Journal of Robotics Research, 6*(1), 32-42.

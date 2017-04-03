l1 = 0.5;
l2 = 0.5;
r2 = 0.25;
m1 = 0.5; m2 = 0.5; m4 =0.5;;m3 = 0.5;
gamma = l1*l2*m3 + l1*l2*m4 + l1*m2*r2;
C_11 = -gamma*sin(theta(2))*theta_dot(2);
C_12 = -gamma*sin(theta(2))*(theta_dot(2)+theta_dot(1));
C_13 = 0; C_14 = 0;
C_21 = -gamma*sin(theta(2))*theta_dot(1);
C_22 = 0; C_23 = 0; C_24 = 0;
C = [C_11, C_12, C_13, C_14;C_21, C_22,C_23, C_24;zeros(2,4)];
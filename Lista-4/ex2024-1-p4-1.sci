s = %s;
z = %z;

K = 2;
wn = 1;
zeta = 0.2;
T = 0.01;

Hs = K*wn^2/(s^2+2*zeta*wn*s+wn^2);

Hz = horner(Hs, (2/T)*(z-1)/(z+1));


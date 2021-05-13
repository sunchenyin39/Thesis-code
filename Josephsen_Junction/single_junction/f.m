function y=f(Ib,Iin,Ic,Rs,delta)
PHI_0=2.067833848E-15;
y=2*pi*Rs/PHI_0*(Ib+Iin-Ic*sin(delta));

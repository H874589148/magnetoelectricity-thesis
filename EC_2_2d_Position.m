q1=2e-9;
q2=-1e-9;
a=0.02;
xx0=0.05;
yy0=0.04;
k=9.0*10^9;
x=linspace(-xx0,xx0,20);
y=linspace(-yy0,yy0,50);
[X,Y]=meshgrid(x);
r1=sqrt((X-a).^2+Y.^2);
r2=sqrt((X+a).^2+Y.^2);
U=k*q1./r1+k*q2./r2;
u0=50;
u=linspace(u0,-u0,11);
contour(X,Y,U,u);
hold on;
contour(-X,Y,U,u);
axis square
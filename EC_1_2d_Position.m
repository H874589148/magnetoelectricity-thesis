k=9e9;
q=1e-9;
r0=0.1;
u0=k*q/r0;
u=linspace(1,3,7)*u0;
x=linspace(-r0,r0,100);
[X,Y]=meshgrid(x);                 %生成矩阵
r=sqrt(X.^2+Y.^2);
U=k*q./r;                              %计算电势
contour(X,Y,U,u);                   %绘制登高线即等势线
axis square                             %将画面比例改为1:1
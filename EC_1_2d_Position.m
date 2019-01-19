k=9e9;
q=1e-9;
r0=0.1;
u0=k*q/r0;
u=linspace(1,3,7)*u0;
x=linspace(-r0,r0,100);
[X,Y]=meshgrid(x);                 %���ɾ���
r=sqrt(X.^2+Y.^2);
U=k*q./r;                              %�������
contour(X,Y,U,u);                   %���ƵǸ��߼�������
axis square                             %�����������Ϊ1:1
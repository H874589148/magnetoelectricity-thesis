th=linspace(0,2*pi,13);             %���ɼ����굥λ����
r0=0.12;[x,y]=pol2cart(th,r0);   %ת�����ѿ�������ϵ
x=[x;0.1*x];
y=[y;0.1*y];
plot(x,y);                                 %��ͼ
axis square                             %�����������Ϊ1:1
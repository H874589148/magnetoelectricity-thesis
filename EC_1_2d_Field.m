th=linspace(0,2*pi,13);             %生成极坐标单位向量
r0=0.12;[x,y]=pol2cart(th,r0);   %转换到笛卡尔坐标系
x=[x;0.1*x];
y=[y;0.1*y];
plot(x,y);                                 %绘图
axis square                             %将画面比例改为1:1
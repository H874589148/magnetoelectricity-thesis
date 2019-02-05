# magnetoelectricity-thesis
# 大二上半学期既2018-2019秋季学期电磁学课程小论文
## 基于MATLAB的电磁场可视化及编程仿真
## Hawkeye
## （中国科学技术大学信息科学技术学院1701班）
## PB1706 210 01

### 摘要：在电磁学学习过程中我们常常接触到一些抽象的模型，比如电场、磁场等等，他们都是物质的存在形式，但是却看不见摸不着，我们引入了电场线、磁场线来描述它们，在这篇小论文中我尝试将信息学知识应用于电磁学学习中，将这些概念与实际图像联系起来，用MATLAB实现对电场、磁场的可视化，对一些数学证明进行仿真模拟，从而对概念和定理有更加深刻地认识。并对生活中的电磁学现象进行仿真模拟。
### 关键词：可视化 编程 仿真 模拟 MATLAB


 
## 一、引言
MATLAB是我们学习过程中的常用工具之一，我们必须要熟练它的使用，而对于信息学院的同学来说将编程仿真与电磁学联系起来是一件很有意义的工作，在这个过程中既能够加深对电磁学抽象概念的理解，又能够巩固专业知识、熟练MATLAB这一工具的使用。
此外我还希望能够通过MATLAB这一工具对课本上的一些定理进行编程仿真从而使定理的证明更加浅显易懂，甚至对我们生活中的电磁学现象进行仿真模拟，使得对这些物理现象的本质有更加深刻的认识。

## 二、对电场中几种常见模型的编程可视化

### 2.1 单点电荷平面电场线
电场是带电体周围产生的一种物质，在电场分布空间的任一点，电荷都会受到一定大小方向的作用力，点电荷在其周围任一点产生的电场强度为：
E=1/(4π¬ϵ_0 )  q/r^2  e_r            (1)
易得：单个点电荷在平面内产生的电场线是从同一点发出的射线，我们可以建立极坐标系来绘制这一模型。
在极坐标系中，相隔相同角度相同长度的极坐标向量即可模拟单点电荷周围的电场线，使用如下程序对这一模型进行仿真模拟：
th=linspace(0,2*pi,13); 
%生成极坐标单位向量
r0=0.12;[x,y]=pol2cart(th,r0);
%转换到笛卡尔坐标系
x=[x;0.1*x];
y=[y;0.1*y];
plot(x,y);
%绘图
axis square
%将画面比例改为1:1

运行程序得到图像（图1）如下：

 ![image](https://github.com/H874589148/magnetoelectricity-thesis/blob/master/EC_1_2d_Field.jpg)
（图1）

### 2.2 单点电荷平面等势线
设无穷远处为电势零势能点，则电场中某一点P的电势为将此电荷从无穷远处移动到P点所做的功的相反数：
U(P)=-∫_P^∞▒Edl=-∫_∞^P▒Edl    (2)
由公式(2)易得单个点电荷在平面内产生的电场线是以一个相同点为圆心的不同半径的圆族。
MATLAB中有绘制等高线的命令，我们可以使用等高线命令contour来对这一模型进行仿真模拟：

k=9e9;
q=1e-9;
r0=0.1;
u0=k*q/r0;
u=linspace(1,3,7)*u0;
x=linspace(-r0,r0,100);
[X,Y]=meshgrid(x);   %生成矩阵
r=sqrt(X.^2+Y.^2);
U=k*q./r;
%计算电势
contour(X,Y,U,u); 
%绘制登高线即等势线
axis square;  %将画面比例改为1:1

运行程序得到图像（图2）如下：

 ![image](https://github.com/H874589148/magnetoelectricity-thesis/blob/master/EC_1_2d_Position.jpg)
（图2）

可以看出在距离中心点电荷近的地方等势线密集，在距离中心点电荷远的地方等势线稀疏，证明在距离中心点电荷近的地方电势变化快，在距离中心点电荷远的地方电势降低缓慢，这与我们的常识相符。

### 2.3 单个点电荷立体电场线
与前文相同，我们尝试绘制单个点电荷在空间的电场线。
单个点电荷在空间内产生的电场线是从同一点发出的射线，我们可以使用如下程序对这一模型进行仿真模拟：

k=9e9;
q=1e-9;
r0=0.1;
u0=k*q/r0;
[X,Y,Z]=sphere(20);
r0=0.1;
x=r0*X(:)';
y=r0*Y(:)';
z=r0*Z(:)';
x=[x;zeros(size(x))];
y=[y;zeros(size(y))];
z=[z;zeros(size(z))];
plot3(x,y,z);hold on;
axis square;
shading interp;

运行程序得到图像（图3）如下：

 ![image](https://github.com/H874589148/magnetoelectricity-thesis/blob/master/EC_1_3d_Field.jpg)
（图3）

### 2.4 单个点电荷立体等势面
单个点电荷在空间内产生的等势面是从同一圆心的同心球族，我们可以使用如下程序对这一模型进行仿真模拟：

k=9e9;
q=1e-9;
r0=0.1;
u0=k*q/r0;
[X,Y,Z]=sphere(20);
r0=0.1;
x=r0*X(:)';
y=r0*Y(:)';
z=r0*Z(:)';
x=[x;zeros(size(x))];
y=[y;zeros(size(y))];
z=[z;zeros(size(z))];
plot3(x,y,z);hold on;
u=linspace(1,3,5)*u0;
[X,Y,Z]=sphere;
r=k*q./u;
Z(X<0&Y<0)=nan;
for i=1:5;
surf(r(i)*X,r(i)*Y,r(i)*Z);
end
shading interp;

运行程序得到图像（图4）如下：

 ![image](https://github.com/H874589148/magnetoelectricity-thesis/blob/master/EC_1_3d_Position.jpg)
（图4）

在这里有一些绘图经验可以分享：在绘制如上图等势面时必须先将电场线画出，再使用hold on命令保留图形之后再绘制等势面，否则在绘制等势面时最外层等势面之内的等势面都会由于没有颜色差异大的参照物而无法显现，只能看到一个被挖空了1/4的球壳，最初一直找不到内层的等势面其实并不是代码的问题。

### 2.5 一对具有等大异号电荷的点电荷在平面上的电场线
要绘制电场线需要生成平面上的均匀向量来形成连续的电场线，举个例子，正如我们学习电场线时模拟实验中使用在玻璃板上平铺的磁化后的铁屑来展示电场线方向的原理，这里也是相似的道理，我们求出平面内电势的分布，那么电势的梯度方向即为所求点处电场方向，我们用该处的向量即小箭头来显示电场方向，随着箭头的密集，可以得到整个平面内的电场线。
空间内任意一点的电势易计算得到：
E ⃗=k q/r ⃗^3  r ⃗         (3)
U ⃗=∫_P^Q▒〖E ⃗dl ⃗ 〗        (4)
U ⃗=k q/r           (5)
U=kq/√(y^2+(x-d/2)^2  )-kq/√(y^2+(x+d/2)^2 )     (6)
x,y即为所求电势点的横纵坐标，d为等量异号点电荷之间的距离，点电荷电量为q。
这里用到2个很方便的MATLAB函数：第一个是quiver专用于绘制箭头图，此 MATLAB 函数 在 x 和 y 中每个对应元素对组所指定的坐标处将向量绘制为箭头。且x 和 y还可以是向量。在默认情况下，箭头缩放到刚好不重叠，但我们可以根据需要将箭头缩放的长一些或短一些。此内容在后文绘制电场线时还会详细提到；另一个是gradient求数值梯度，此 MATLAB 函数返回向量U的一维数值梯度。电势的梯度即是电场，利用此函数输出U对应于∂U/∂x即x（水平）方向上的差分。点之间的间距假定为 1。程序如下：

q1=2e-9;
q2=-1e-9;
k=9e9;
a=0.02;
xx0=0.05;
yy0=0.04;
x=linspace(-xx0,xx0,20);
y=linspace(-yy0,yy0,50);
[X,Y]=meshgrid(x);
r1=sqrt((X-a).^2+Y.^2);
r2=sqrt((X+a).^2+Y.^2);
U=k*q1./r1+k*q2./r2;
u0=50;
u=linspace(u0,-u0,11);
[Ex,Ey]=gradient(-U);
E=sqrt(Ex.^2+Ey.^2);
Ex=Ex./E,Ey=Ey./E;%让箭头等长
quiver(X,Y,Ex,Ey);

运行程序得到图像（图5）如下：

 ![image](https://github.com/H874589148/magnetoelectricity-thesis/blob/master/EC_2_2d_Field.jpg)
（图5）

在上面的程序中有一个很重要的命令：Ex=Ex./E,Ey=Ey./E;它的作用是让平面内所有向量均缩小或放大变为单位向量，他们的模长相等，即箭头等长，否则会出现在距离两个点电荷中心近的地方电场强矢量模长长而离点电荷远的地方箭头长度几乎看不到的情况。

### 2.6 一对具有等大异号电荷的点电荷在平面上的等势线
等势线原理同上，根据式（6）使用等高线命令coutour易绘制得到，本文中给出图形,代码不加以详细解释，等大异号点电荷在平面上的等势线如图6所示：

 ![image](https://github.com/H874589148/magnetoelectricity-thesis/blob/master/EC_2_2d_Position.jpg)
（图6）
同理，以U为z轴，在空间内可以绘制出电势变化曲面（图7），可以看出下图中的等高线即为上图中的等势线。
 ![image](https://github.com/H874589148/magnetoelectricity-thesis/blob/master/EC_2_3d_Position.jpg)
（图7）

## 三、对磁场中常见模型的编程可视化

### 3.1 无限长直导线通电后周围的磁场
首先计算无限长直线电流 I 在距离导线为r0的点 P 处的磁场：
B=∫_A1^A2▒〖dB=μ_0/4π ∫_A1^A2▒Idlsinφ/r^2 〗       (7)

进行变量替换：

l=-r_0 cotφ                     (8)
dl=(r_0 dφ)/(〖sin〗^2 φ)                       (9)

由（7）（8）（9）式联立可得：
B=μ_0/4π ∫_φ1^φ2▒Isinφdφ/r_0 =(μ_0 I)/(4πr_0 ) cosφ_1-cosφ_2 (10)
对于无限长直导线，ψ1=0，ψ2=π，所以得到：
B=(μ_0 I)/(2πr_0 )                   (11)
|B ⃗ |=(μ_0 I)/(2π√(x^2+y^2 ))            (12)
B_x=(-|B ⃗ |y)/√(x^2+y^2 )               (13)
B_y=|B ⃗ |x/√(x^2+y^2 )               (14)
如前文电场线绘制，此处使用MATLAB函数quiver可以得到磁场分布，源代码如下：
x=-0.5:0.05:0.5;y=x;I=100;
mu0=4*pi*1e-7;C0=mu0/(4*pi);
[X,Y]=meshgrid(x,y);
Bx=-2.*C0.*I.*Y./(X.^2+Y.^2).^(3./2)./(1./(X.^2+Y.^2)).^(1./2);
By=2.*C0.*I.*X./(X.^2+Y.^2).^(3./2)./(1./(X.^2+Y.^2)).^(1./2);
B=(4.*C0.^2.*I.^2.*Y.^2./(X.^2+Y.^2).^2+4.*C0.^2.*I.^2.*X.^2./(X.^2+Y.^2).^2).^(1./2);
quiver(X,Y,Bx,By,2);
axis([-0.5,0.5,-0.5,0.5]);
axis square;

磁场分布如图8所示，符合右手螺旋定则：
![image](https://github.com/H874589148/magnetoelectricity-thesis/blob/master/plot_B.jpg)
（图8）

### 3.2 环形电流附近的磁场
我们来比较电偶极子产生的电场和环形电流产生的磁场：

 ![image](https://github.com/H874589148/magnetoelectricity-thesis/blob/master/cycle_B.jpg)
（图9）

尽管在电荷或者电流附近这两种场的分布截然不同，但是在远处却是完全相同的，不仅如此，它和条形磁铁、地球近似磁场分布也是相同的，我们在之后的太阳风对地球磁场的模拟中同样会用到这张图。环形电流周围的磁场线如图10所示：

 
（图10）

## 四、对亥姆霍兹线圈磁场的编程仿真
亥姆霍兹线圈是一对彼此平行且连通的共轴圆形线圈，每一线圈N匝，两线圈内的电流方向一致，大小相同，当两个线圈圆心之间距离为线圈半径时，两线圈中点的磁场具有较好的均匀度，在科学研究中经常使用这种方式来构建匀强磁场。根据毕奥 - 萨伐尔定律我们可以求得圆环电流轴线上任意一点的磁感应强度为：
B_x=μ_0/2  (R^2 I)/(R^2+x^2 )^(3/2)        (15)
R为线圈半径，I为线圈电流，x为所求点到线圈中心的距离。
取两线圈中点为坐标原点建立笛卡尔坐标系，设两线圈之间的距离为d，则坐标轴上点的磁感应强度为：
B_x=μ_0/2  (R^2 I)/〖[R^2+(d/2+x^2]〗^(3/2) +μ_0/2  (R^2 I)/〖[R^2+(d/2-x)^2]〗^(3/2)         (16)
该式对x求导，可以求出x=0是磁场的极值点，要使磁场区间均匀，那么就要使其二阶导数为0，则：
├ (d^2 B(x))/(dx^2 )┤|_(x=0)=0              (17)
通过解以上代数式可以得到d=R时磁场最为均匀。
但是，这个数学推导过程是较为复杂的，中间涉及的计算和求导过程也非常繁琐，利用MATLAB对这一模型进行仿真模拟我们就很容易看出当圆形线圈间距为半径R时中间的磁场最为均匀：

 
（线圈中心距离为R/2时线圈周围磁场强度）

如图，假设线圈半径为10，在滑动滑条过程中可以改变线圈间距为0——20之间，也可以在文本框中输入线圈间距来得到图形，在这样一个界面上我们很容易看出当线圈间距为10即R/2时线圈之间的磁场最为均匀。

 
（线圈中心距离为R时线圈周围磁场强度）


 
（线圈中心距离为3R/2时线圈周围磁场强度）

 

（线圈中心距离为2R时线圈周围磁场强度）
## 五、太阳风作用于地球的磁场形成的空间磁场图景仿真模拟

### 5.1 太阳风与地磁场
太阳风是太阳对外释放的一种能量，它本质上是太阳向太阳系各大行星和恒星释放的很高速度和不稳定强度的电离气体流，太阳风会对地球带来很大的影响，比如破坏卫星、电信系统，出现磁暴等等，对人的身体也有很大影响。
地磁场就像船头一样保护着地球，使地球能够在广袤的宇宙空间中平稳航行，如图所示：
 ![image](https://github.com/H874589148/magnetoelectricity-thesis/blob/master/太阳风作用于地球磁场.png)
（图11）

### 5.2 MATLAB仿真模拟
我想尝试用MATLAB对这一漂亮的宇宙空间图景进行仿真模拟，把地球磁场等效为地球球心的环形电流形成的磁场，在前文图10中先将x,y轴对调，然后对y轴左侧图像进行压缩，对y轴右侧图像进行拉伸即可得到与宇宙空间中相似的磁场分布，如图12所示。

 ![image](https://github.com/H874589148/magnetoelectricity-thesis/blob/master/suncloud.jpg)
（图12）

将以上MATLAB图像稍作修改，可以实现对地球磁场在宇宙空间内图景的模拟如图13所示：
 ![image](https://github.com/H874589148/magnetoelectricity-thesis/blob/master/太阳风作用于地球磁场模拟图.jpg)
（图13）

## 六、总结与展望

在本次实验中我针对一些非常常见的电磁学模型进行了模拟，既锻炼了使用MATLAB这一数学工具的能力，又加深了对电磁学概念的理解。但是还是受到时间和技术能力的限制，没能完成一些工作，希望在今后的学习过程中能够继续探索，不断思考来解决这些问题。
首先是我进行可视化的模型基本都是非常简单的，变量很少的，不能和使用者进行交互的，在这方面可以进行许多改进，比如增加点电荷的数量，改变点电荷相对位置等等，形成许多复杂的模型，随着学习的深入，我相信今后一定可以对更多的想要去了解的模型进行可视化。
其次在对亥姆赫兹线圈的模拟当中，可以考虑做一个三维的交互界面，加入线圈使得模拟实验的现象更加直观。
最后在对太阳风对地磁场的影响的模拟当中，我只是进行了定性的模拟，如果能够进行定量计算，再来模拟这个现象，那么对电磁学知识的了解就会更加深入了。
以上三个方面的问题都有待进一步深入学习和基于更加精细的计算进行探讨。



 

## 参考文献：
	<br>叶邦角. 电磁学. 合肥：中国科学技术大学出版社[M]，2014.8；191-194.</br>
	<br>杨丹. 赵海滨. MATLAB从入门到精通[M]. 北京：中国铁道出版社，2013</br>
	<br>林国华. 王永顺. 运用MATLAB程序延时点电荷系的等势面[J]. 物理通报：2003（12）：27-28</br>
	<br>王沫然. MATLAB与科学计算[M]. 北京：电子工业出版社，2003</br>
	<br>陈怀琛. MATLAB及其在理工课程中的应用指南[M]. 西安：西安电子科技大学出版社，2003</br>
	<br>电偶极子辐射仿真https://wenku.baidu.com/view/34f5586f79563c1ec5da71b1.html</br>
	<br>地球磁场是一个无情的太阳风粉碎机器https://baijiahao.baidu.com/s?id=1602428205071568477&wfr=spider&for=pc</br>

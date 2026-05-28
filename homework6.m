%标准球面绘制程序
subplot(2,2,1),sphere(3);
title('n=3'),axis equal
subplot(2,2,2), sphere(6);
title('n=6'),axis equal
subplot(2,2,3), sphere(10)
title('n=10'),axis equal
subplot(2,2,4), sphere(15);
title('n=15'),axis equal
%标准柱面绘制程序
t=linspace(pi/2,3.5*pi,50);R=cos(t)+2;
subplot(2,2,1);
cylinder(R,3), title('n=3'); %cylinder画柱面cylinder(R,n),n是侧面边数（精度）
subplot(2,2,2)
cylinder(R,6),title('n=6');
subplot(2,2,3)
cylinder(R),title('n=20')
subplot(2,2,4)
cylinder(R,50),title('n=50')

[x,y]=meshgrid(-8:0.5:8,-10:0.5:10);% 生成二维平面网格坐标矩阵
R=sqrt(x.^2+y.^2)+eps;  %为什么要加eps？防止分母为0加上及其小的数eps
z=sin(R)./R;
mesh(x,y,z); %mesh=网格 绘制三维网格曲面图，mesh(横坐标矩阵,纵坐标矩阵,高度矩阵)

s=0:0.1:8    %我们一开始定义的s和t都属于一维向量
t=0:0.1:5*pi
[S, T] = meshgrid(s, t); % 关键！把一维参数转成二维网格
%小写 s, t：表示原始的一维参数向量
%大写 S, T：表示经过 meshgrid 扩展后的二维矩阵
x=exp(-S).*cos(T)
y=exp(-S).*sin(T)
z=T
mesh(x,y,z)%镂空的网格线图，只有线条，没有填充色
surf(x,y,z)%实心的填充曲面，有颜色、有光照

x=@(s,t) exp(-s).*cos(t); %@(s,t):定义匿名函数，输入是两个参数 s, t 意思：x 是 s 和 t 的函数
y=@(s,t) exp(-s).*sin(t);
z=@(s,t) t;
fsurf(x,y,z,[0 8 0 5*pi]) %fsurf = 画参数曲面 参数范围： [smin smax tmin tmax] fill surface（填充曲面）
%surf必须先算出所有点的坐标
%fsurf画的是方程

%绘制三维网格图
x=-pi:0.15:pi
y=sin(x)
subplot(211),H=bar(x,y)
xx=get(H,'xdata')%变量 = get(对象句柄, '属性名') [C,W] = get(H,{'Color','LineWidth'});
yy=get(H,'ydata')%set(对象句柄, '属性名', 新值)  set(H,'Color','b','LineWidth',1.5,'LineStyle',':');
subplot(212),plot(xx,yy)

%新打开一幅图，用set命令将条形图横坐标设置成0~4*pi，同时将纵坐标设置为横坐标数据的余弦值。
figure 
x=0:0.01:4*pi
y=cos(x)
bar(x,y)
set(gca,"XLim",[0,4*pi]) %gca = get current axes 获取当前坐标轴
set(gca,"YLim",[-1,1])   %Y Limit → Y 轴的范围[最小值, 最大值]

%绘制两个相互垂直且直径相等的圆柱体相交图形。  
m=30;
z=1.2*(0:m)/m;%圆柱1长1.2
r=ones(size(z)); 
theta=(0:m)/m*2*pi;%画圆时的角度等分为m+1份
x1=r'*cos(theta); %圆底投影在xy平面上
y1=r'*sin(theta);
z1=z'*ones(1,m+1);
surf(x1,y1,z1) %画圆柱1
axis equal,axis off
hold on
x=(-m:2:m)/m;%圆柱2长2
x2=x'*ones(1,m+1);
y2=r'*cos(theta);%圆底投影在yz平面上
z2=r'*sin(theta);
surf(x2,y2,z2);%画第二个圆柱
axis equal,axis off
title('两个相交的圆柱体')
hold off

%绘出函数x=sin(t) ,y=t.^2+exp(t)的慧星效果图
t=-2:0.1:2
x=sin(t)
y=t.^2+exp(t)
%plot(t,x,t,y)
comet(x, y);    %comet:彗星
title('参数方程 x=sin(t), y=t^2+e^t 的彗星效果图');
xlabel('x');
ylabel('y');
grid on;

%分别利用meshgrid和向量相乘两种方法生成以下平面网格点坐标矩阵X、Y：?
x=-5:1:0
y=-1:1:3
[X,Y]=meshgrid(x,y) %meshgrid 其实就是一个"自动铺网格"的工具。

x = -5:0
y = (-1:3)'%后面的 ' 表示转置,从行向量转变为列向量
X = ones(length(y),1)*x %length(y) = 5
Y = y*ones(1,length(x)) %length(x) = 6
[X,Y]=meshgrid(x,y)  % 生成网格坐标矩阵（mesh必备前置）
mesh(X,Y)   % 空心网格图
surf(X,Y)   % 实心填充曲面图

%多峰函数peaks的表达式为
x=-10:0.1:10
y=-10:0.1:10
[X,Y]=meshgrid(x,y)
Z=peaks(X,Y)
figure;

subplot(2,2,1); mesh(X,Y,Z); title('mesh 线框曲面');     %网眼 / 网格
subplot(2,2,2); meshc(X,Y,Z); title('meshc 线框+等高线');%mesh + contour 线框 + 底部等高线
subplot(2,2,3); meshz(X,Y,Z); title('meshz 线框+零平面');%mesh + z-axis  线框 + 零平面参考
subplot(2,2,4); surf(X,Y,Z); title('surf 着色曲面');


set(gca,'XLim',[-3,3])
set(gca,'YLim',[-3,3])
set(gca,'ZLim',[-8,8])


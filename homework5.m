x=-2:0.1:2;  y=sin(x);
subplot(221),stairs(x,y), title('(a) stairs') %简写：subplot(2,2,1) → subplot(221) staris 阶梯图
subplot(222),compass(cos(x),y),title('(b) compass')%compass是罗盘图
y1=randn(1,10000);
subplot(223),hist(y,20),title('(c) hist')% hist直方图（统计分布）
subplot(224),[u,v]=meshgrid(-2:0.2:2,-1:0.15:1);%meshgrid → 生成网格坐标（画 3D / 等高线必备）
z=u.*exp(-u.^2-v.^2);
[px,py]=gradient(z,0.2,0.15);
contour(u,v,z),hold on
quiver(u,v,px,py),hold off,axis image
title('(d) quiver')
%%%%%%%%%%%
x=-2:0.2:2;
y=sin(x);
L=rand(1,length(x))/10;
U=rand(1,length(x))/10;
errorbar(x,y,L,U,':')
%%%%%%%%%%%%%
%取合适的θ范围，在同一图形窗口绘制下4幅极坐标图。
theta=0:0.01:10*pi
A1=1.0013*theta.^2
A2=cos(3.5*theta)
A3=sin(theta)./theta
A4=1-cos(7*theta).^3
subplot(221),polar(theta,A1,'-r')%ploar 是极坐标绘图polar(theta, rho) 
subplot(222),polar(theta,A2,'-b')
subplot(223),polar(theta,A3,'-g')
subplot(224),polar(theta,A4,'-c')
%%%%%%%%%%%
%某校共有1560名学生，其中计算机系有213名学生，外语系有387名学生
%音乐系有220名学生，美术系有280名学生，中文系有280名学生，理科系180名学生
%分别画出饼图、条形图示意学生分布。
x=[213 387 220 280 280 180]
name={'计算机','外语','音乐','美术','中文','理科'}
subplot(1,2,1)
pie(x,name)
title("学生分布饼状图")
subplot(122)
bar(x)
set(gca,"xticklabel",name) %Get Current Axes:获取当前坐标轴
%set(对象, '属性名', 属性值)
title("学生柱状分布图")
%%%%%%%%%%%%%%%%%
%二阶系统时域响应
t=0:0.01:20
theta=[0,0.3,0.5,0.707]
figure;hold on;grid on;
for i=1:length(theta)
    A=theta(i)
    if A==0
        y = 1 - cos(t);
    else
    y1=1-1./sqrt(1-A^2)*exp(-A*t).*sin(sqrt(1-A^2)*t+acos(A))%常数 ÷ 向量 → 必须写成 ./
    end
    subplot(2,2,i),plot(t,y1,'LineWidth',1.5)
    title(['阻尼比 \zeta = ', num2str(A)]); % 自动显示当前阻尼比
    legend(['\zeta=',num2str(A)]);
end
%绘制参数方程曲线
t=0:0.01:pi
x=sin(3*t).*cos(t)
y=sin(3*t).*sin(t)
plot(x, y, 'r-', 'LineWidth', 1.5);
axis equal
grid on
title('参数方程曲线：x=sin(3t)cost, y=sin(3t)sint');
xlabel("t")
ylabel('y');
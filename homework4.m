t=0:0.1:2*pi
y=sin(t)
plot(t,y)  %plot英文本意：绘制、画图、描点连线
%plot( x自变量, y因变量, '线型颜色标记' )

t=0:0.1:2*pi
y1=sin(t)
y2=cos(t)
y3=y1.*y2
plot(t,y1,'--r',t,y2,':g',t,y3,'x')
plot(t,y1,'-c',t,y2,'-.y',t,y3,'d')
%线形：- 实线;-- 虚线; : 点线; -. 点划线
%颜色：r:红  g:绿 b:蓝 c:青 y:黄 m:品红 k:黑
%数据点标记:x:叉号 d:菱形

t=0:0.1:2*pi
y=sin(t)
plot(t,y)
grid on %开启网格线
xlabel("时间"),ylabel("函数值"),title("正弦曲线")
axis([0,6,-1.2,1.2]) %axis=轴 axis ([x 左，x 右，y 下，y 上])

%%%%%%%交互式图形命令
axis([0,5,0,5])
hold on     %保持画布，后面画的东西不覆盖前面
box  on      %给图加上外框方框
x=[]
y=[]
while(1)
    [x1,y1,button]=ginput(1)% get input获取输入 1:等待鼠标点一下 
    % 返回x1:点的横坐标 y1:点的纵坐标 button:哪个键（1=左键，2=中键,3=右键） 
    if(button~=1) 
        break  %break只跳出【最近一层 while/for 循环】
    end
    plot(x1,y1,'o')
    x=[x,x1]%本质是i+=1 接上矩阵拼接
    y=[y,y1]
end % break 跳转到这一行的后面
line(x,y)
hold off %结束画布保持
gtext("用左键取点，然后划线")%：鼠标点哪里，文字就写在哪里

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%在同一坐标系绘制t^3,-t^2,t^2*sin(t)在[0,2π]内的曲线图。
t=0:0.1:2*pi
y1=t.^3
y2=-t.^2
y3=t.^2.*sin(t)
plot(t,y1,"-r",t,y2,"--g",t,y3,":b")
%必须使用.乘 因为 t不是一个数，而是一长串数字（向量）？😎

%在同一图形窗口画三个子图，要求使用指定gtext、axis、legend、title、xlabel和ylabel。
%plot(t,y1,"-r",t,y2,"--g",t,y3,":b")
t=0:0.1:2*pi
y1=t.^3
subplot(3,1,1)
plot(t,y1,"-r")
axis([0,5,-30,+150])
title("y1的函数图像")
xlabel("时间")
ylabel("幅值")
legend('y1=t^3');%加图例，说明曲线是什么
y2=-t.^2
subplot(3,1,2)
plot(t,y2,"--g")
axis([0,5,-100,10])
title("y2的函数图像")
xlabel("时间")
ylabel("幅值")
legend('y2=-t^2');
y3=t.^2.*sin(t)
subplot(3,1,3)
plot(t,y3,":b")
axis([0,5,-30,+15])
title("y3的函数图像")
xlabel("时间")
ylabel("幅值")
legend('y3=t.^2.*sin(t)');
gtext("😎")
% plot(t,y1,'-r', t,y2,'--g', t,y3,':b'); %这俩是一一对应的。但是单独的只能对应单独的
% legend('t^3','-t^2','t^2*sin(t)');

%绘制y=exp(x/3)*sin(3x)的图像，要求用蓝色的星号画图
% 并且在同一坐标轴中画出其包络线y=±exp(x/3)的图像，用红色的点划线画图。
x=0:0.1:4*pi
y1=exp(x/3).*sin(x*3)%因为 x 是向量，两个向量相乘必须点乘!!!!!!!!
y2=exp(x/3)
y3=-exp(x/3)
plot(x,y1,'*b',x,y2,'-.r',x,y3,'-.r')
legend('y=e^{x/3}sin(3x)','包络线±e^{x/3}');
title('函数与其包络线');
xlabel('x');
ylabel('y');

%画一个半径为2的圆,本质是极坐标和参数方程
r=2
theta=0:0.01:2*pi
x=r*cos(theta)
y=r*sin(theta)
plot(x,y,':r');   % 横坐标x 纵坐标y 红色点线
%plot(theta,x,":r",theta,y,":r")错把角度当 x 轴，画的是三角函数曲线，不是圆！
axis equal;
axis([-3,3,-3,3]);

%一个矩形脉冲信号，从计时0时刻，上升沿开始时间为1，脉冲宽度为1，高度为2。
t=0:0.01:10
y=zeros(size(t))
idx= t>=1 & t<=2
y(idx)=2;
plot(t,y,'b-.','LineWidth',1.5)
grid on
axis([0,10,0,2])
legend("脉冲信号")

% 连续周期性方波
t = 0:0.01:10; 
y = zeros(size(t));%size(t)先拿到t的行列大小
%zeros(行数,列数)生成和t一模一样维度的全0数组
% 逻辑：每隔2个单位周期，前1高电平，后1低电平
idx1 = mod(t,2) < 1;   % mod 取余数定周期
y(idx1) = 2;
plot(t,y,'b-.','LineWidth',1.5)
grid on
axis([0,10,0,2])
legend("脉冲信号")
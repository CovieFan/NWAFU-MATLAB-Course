for i=1:100000
    x(i)=i
end

x=1:100000
%求斐波那契数列中第一个大于10000的元素。
a(1)=1,a(2)=1,i=2
while(a(i)<=10000)
    a(i+1)=a(i)+a(i-1)
    i=i+1
end
i;a(i)

area = functiondemo(5, 'g')

%编写函数文件，分别用for和while循环语句编写程序
i=0,K=0
while(i<64)
    K=2^i+K
     i=i+1
end
i,K

i=0,K=0
for i=0:63
    K=2^i+K
end
i,K

%用MATLAB语言实现下面分段函数
x=input("请输入x:")
if x>1
    y=1
elseif x<-1
    y=-1
else
    y=x
end
y

%用for-end循环求出从100-200之间的所有素数。
%要求编写两个文件：
%1）函数文件：用于判断输入变量是否为素数
%2）脚本文件：对变量100~200调用以上函数文件。
i=0
for x=100:200
    if isprime(x)==1
        i=i+1
        x
    else
    end
end

%用while-end循环求1-100的所有数值和。
i=1,A=0
while(i<=100)
    A=i+A
    i=i+1
end
A




% 1. 不带's' 只收数字
reply = input('请输入一个字符 ');
% 2. 带 's' 收任意字符/文字
reply = input('请输入一个字符 ','s');%全部当成字符串文本接收

t=0:0.1:2*pi
y1=sin(t)
y2=cos(t)
y3=y1.*y2
k=menu('菜单','菜单1','菜单2','菜单3')%k=menu('菜单',k=1,k=2,k=3)
if k==1
     plot(t,y1,'r')   
elseif k==2
     plot(t,y2,'g')
else
     plot(t,y3,'b')
end

global a
a=8
globaltest()

%输入一行字符，分别统计出其中英文字母、空格、数字和其它字符的个数。
letter=0
space=0
number=0
other=0
word=input(" 请输入一行字符：",'s')
for i=1:length(word)
    if (word(i)>='a'&&word(i)<='z')||(word(i)>='A'&&word(i)<='Z')%写 if 判断条件：只用双符 && ||,按位二进制运算才需要单独写
        letter=letter+1;
    elseif word(i)==' '
        space=space+1;
    elseif word(i)>='0'&&word(i)<='9'
        number=number+1;
    else
        other=other+1;
    end
end
fprintf('英文字母个数：%d\n',letter);
fprintf('空格个数：%d\n',space);
fprintf('数字个数：%d\n',number);
fprintf('其他字符个数：%d\n',other);

%
a=input("请输入a= ")
n=input("请输入n= ")
s=0
i=0
for c=n:-1:1                %for 必须写：for 循环变量 = 起始：步长：结束
    s=c*a*10^(i)+s
    i=i+1
    
end
s

%
year=input("请输入年份：")
if mod(year,4)==0
    if mod(year,100)==0
        if mod(year,400)==0
            fprintf("%d是闰年",year)
        else
            fprintf("%d不是闰年",year)
        end
    else
        fprintf("%d是闰年",year)
    end
else
        fprintf("%d不是闰年",year)
end


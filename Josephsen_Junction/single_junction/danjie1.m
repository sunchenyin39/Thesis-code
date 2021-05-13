clear
T_MAX=120E-12;
T_MIN=0;
h=0.25E-12; %一个区间长度
number=(T_MAX-T_MIN)/h;%区间个数
t=0:h*1E12:T_MAX*1E12;
load ('delta.mat')
 
subplot(2,2,1);
plot(t,delta(:,1),'r','Linewidth',2);
grid;
xlabel('时间/ps');
ylabel('相位');
title('Rs=16Ω，输入单磁通');
 
subplot(2,2,2); %%子图2绘制
plot(t,delta(:,2),'k','Linewidth',2);
grid;
xlabel('时间/ps');
ylabel('相位');
title('Rs=5Ω，输入单磁通');
 
subplot(2,2,3); %%子图3绘制
plot(t,delta(:,3),'m','Linewidth',2);
grid;
xlabel('时间/ps');
ylabel('相位');
title('Rs=1Ω，输入单磁通');
 
subplot(2,2,4); %%子图4绘制
plot(t,delta(:,4),'g','Linewidth',2);
grid;
xlabel('时间/ps');
ylabel('相位');
title('Rs=5Ω，输入双磁通');

clear
%解析非对称双结SQUID
%参数设置
PHI_0=2.067833848E-15;

ib=0.75;
Ic=0.24E-3;
Ib=ib*Ic;
Ic1=0.24E-3;
Ic2=0.24E-3;
L=10E-12;
n=0;
number=10000;%区间小段个数

t=-pi/2:pi/number:pi/2;
[fai_1,fai_2]=meshgrid(t);
f1=fai_1-fai_2-2*pi/PHI_0*L*0.5*(-Ic1*sin(fai_1)+Ic2*sin(fai_2))-2*n*pi;
f2=Ib-Ic1*sin(fai_1)-Ic2*sin(fai_2);

f_min=100;
fai_1_min=-pi/2;
fai_2_min=-pi/2;
for i=1:number+1
    for j=1:number+1
        if abs(f1(i,j))+abs(f2(i,j))<f_min
            f_min=abs(f1(i,j))+abs(f2(i,j));
            fai_1_min=-pi/2+(i-1)*pi/number;
            fai_2_min=-pi/2+(j-1)*pi/number;
        end
    end
end

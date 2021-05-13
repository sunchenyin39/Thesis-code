clear
%��Լɪ��ɭ��
PHI_0=2.067833848E-15;
ib=0.75;
Ic=0.25E-3;
Ib=ib*Ic;
Rs=5;  


T_MAX=120E-12;
T_MIN=0;
h=0.25E-12; %һ�����䳤��
number=(T_MAX-T_MIN)/h;%�������
i_in=zeros(number+1,1);%�����������
i_in_width=10E-12;%����������
i_in_max_point=1+number/2+i_in_width/h/2;%����������ֵ�ı��
i_in_max=PHI_0*2/i_in_width/Rs;%������������ֵ��


for i=1:number+1
    if i<1+number/2
        i_in(i,1)=0;
    end
    if (i>=1+number/2)&&(i<=i_in_max_point)
        i_in(i,1)=i_in_max/(i_in_max_point-(1+number/2))*(i-(1+number/2));
    end
    if (i>i_in_max_point)&&(i<=i_in_max_point+i_in_width/h/2)
        i_in(i,1)=-i_in_max/((i_in_max_point+i_in_width/h/2)-(i_in_max_point))*(i-(i_in_max_point+i_in_width/h/2));
    end
end

delta=zeros(number+1,1);%��λ
delta(1,1)=asin(ib);
for i=2:number+1
    f1=f(Ib,i_in(i-1),Ic,Rs,delta(i-1));
    f2=f(Ib,i_in(i-1)+(i_in(i_in_max_point,1)-i_in(i_in_max_point-1,1))/2,Ic,Rs,delta(i-1)+h/2*f1);
    f3=f(Ib,i_in(i-1)+(i_in(i_in_max_point,1)-i_in(i_in_max_point-1,1))/2,Ic,Rs,delta(i-1)+h/2*f2);
    f4=f(Ib,i_in(i-1)+(i_in(i_in_max_point,1)-i_in(i_in_max_point-1,1)),Ic,Rs,delta(i-1)+h*f3);
    delta(i)=delta(i-1)+h/6*(f1+2*f2+2*f3+f4);
end
plot(delta)
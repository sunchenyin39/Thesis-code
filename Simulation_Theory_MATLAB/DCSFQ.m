clear
%Simulation of DC/SFQ converter 

%There are 47 variables in equations,so we need to construct 47 equations.
%And we should convert these 47 equations to linear equations for
%convenience.

%Variables
%v1        x1
%v2        x2
%v3        x3
%v4        x4
%v5        x5
%v6        x6
%v7        x7
%v8        x8
%v9        x9
%v10       x10
%v11       x11
%v12       x12
%v13       x13
%v14       x14
%v15       x15
%v16       x16
%v17       x17
%v18       x18
%v19       x19
%v20       x20
%v21       x21
%v22       x22
%I12       x23
%I23       x24
%I34       x25
%I35       x26
%I56       x27
%I57       x28
%I76       x29
%I86       x30
%I98       x31
%I6_10     x32
%I10_11    x33
%I11_12    x34
%I10_15    x35
%I10_13    x36
%I13_14    x37
%I17_16    x38
%I16_15    x39
%I15_18    x40
%I18_19    x41
%I15_20    x42
%I20_21    x43
%I15_22    x44
%phi_1     x45
%phi_2     x46
%phi_3     x47

%equations
% 1    v1(n)=0  ->  x(1,n)=0
% 2    I12(n)=i2_t(n)  -> x(23,n)=i2_t(n)
% 3    (2*h)/(3*L2)(v2(n)-v3(n))-I23(n)=-4/3*I23(n-1)+1/3*I23(n-2)  ->  (2*h)/(3*L2)(x(2,n)-x(3,n))-x(24,n)=-4/3*x(24,n-1)+1/3*x(24,n-2) 
% 4    v4(n)=0  ->  x(4,n)=0
% 5    (2*h)/(3*L3)(v3(n)-v5(n))-I35(n)=-4/3*I35(n-1)+1/3*I35(n-2)  ->  (2*h)/(3*L3)(x(3,n)-x(5,n))-x(26,n)=-4/3*x(26,n-1)+1/3*x(26,n-2)
% 6    (2*h)/(3*L7)(v3(n)-v4(n))-I34(n)=-4/3*I34(n-1)+1/3*I34(n-2)  ->  (2*h)/(3*L7)(x(3,n)-x(4,n))-x(25,n)=-4/3*x(25,n-1)+1/3*x(25,n-2)
% 7    I12(n)-I23(n)=0  ->  x(23,n)-x(24,n)=0
% 8    I23(n)-I34(n)-I35(n)=0  ->  x(24,n)-x(25,n)-x(26,n)=0
% 9    v5(n)-v7(n)-I57(n)*R2=0  ->  x(5,n)-x(7,n)-x(28,n)*R2=0
% 10   I35(n)-I56(n)-I57(n)=0  ->  x(26,n)-x(27,n)-x(28,n)=0
% 11   I57(n)-I76(n)=0  ->  x(28,n)-x(29,n)=0
% 12   (2*h)/(3*L8)(v7(n)-v6(n))-I76(n)=-4/3*I76(n-1)+1/3*I76(n-2)  ->  (2*h)/(3*L8)(x(7,n)-x(6,n))-x(29,n)=-4/3*x(29,n-1)+1/3*x(29,n-2)
% 13   v5(n)-v6(n)-2*h*RB/(2*h+3CB*RB)*I56=-2*h*RB/(2*h+3CB*RB)*(2.25*Ic*sin(4/3*phi_1(n-1)_1/3*phi_1(n-2)+2*pi/PHI_0*2*h/3*(2.5*(v5(n-1)-v6(n-1))-2*(v5(n-2)-v6(n-2))+0.5*(v5(n-3)-v6(n-3))))-2*CB/h*(v5(n-1)-v6(n-1))+CB/2/h*(v5(n-2)-v6(n-2)))
%      x(5,n)-x(6,n)-2*h*RB/(2*h+3CB*RB)*x(27,n)=2*h*RB/(2*h+3CB*RB)*(2.25*Ic*sin(4/3*x(45,n-1)-1/3*x(45,n-2)+2*pi/PHI_0*2*h/3*(2.5*(x(5,n-1)-x(6,n-1))-2*(x(5,n-2)-x(6,n-2))+0.5*(x(5,n-3)-x(6,n-3))))-2*CB/h*(x(5,n-1)-x(6,n-1))+CB/2/h*(x(5,n-2)-x(6,n-2)))
% 14   I86(n)+I56(n)+I76(n)-I6_10(n)=0 -> x(30,n)+x(27,n)+x(29,n)-x(32,0)=0
% 15   (2*h)/(3*L0)(v8(n)-v6(n))-I86(n)=-4/3*I86(n-1)+1/3*I86(n-2)  ->  (2*h)/(3*L0)(x(8,n)-x(6,n))-x(30,n)=-4/3*x(30,n-1)+1/3*x(30,n-2) 
% 16   I98(n)-I86(n)=0  ->  x(31,n)-x(30,n)=0
% 17   v9(n)=0  ->  x(9,n)=0;
% 18   I98(n)=i0_t(n)  ->  x(31,n)=i0_t(n)
% 19   (2*h)/(3*L4)(v6(n)-v10(n))-I6_10(n)=-4/3*I6_10(n-1)+1/3*I6_10(n-2)  ->  (2*h)/(3*L4)(x(6,n)-x(10,n))-x(32,n)=-4/3*x(32,n-1)+1/3*x(32,n-2) 
% 20   v10(n)-v11(n)-2*h*RB/(2*h+3CB*RB)*I10_11=-2*h*RB/(2*h+3CB*RB)*(2.25*Ic*sin(4/3*phi_2(n-1)_1/3*phi_2(n-2)+2*pi/PHI_0*2*h/3*(2.5*(v10(n-1)-v11(n-1))-2*(v10(n-2)-v11(n-2))+0.5*(v10(n-3)-v11(n-3))))-2*CB/h*(v10(n-1)-v11(n-1))+CB/2/h*(v10(n-2)-v11(n-2)))
%      x(10,n)-x(11,n)-2*h*RB/(2*h+3CB*RB)*x(33,n)=2*h*RB/(2*h+3CB*RB)*(2.25*Ic*sin(4/3*x(46,n-1)-1/3*x(46,n-2)+2*pi/PHI_0*2*h/3*(2.5*(x(10,n-1)-x(11,n-1))-2*(x(10,n-2)-x(11,n-2))+0.5*(x(10,n-3)-x(11,n-3))))-2*CB/h*(x(10,n-1)-x(11,n-1))+CB/2/h*(x(10,n-2)-x(11,n-2)))
% 21   (2*h)/(3*L9)(v11(n)-v12(n))-I11_12(n)=-4/3*I11_12(n-1)+1/3*I11_12(n-2)  ->  (2*h)/(3*L9)(x(11,n)-x(12,n))-x(34,n)=-4/3*x(34,n-1)+1/3*x(34,n-2)
% 22   v12(n)=0  ->  x(12,n)=0
% 23   v14(n)=0  ->  x(14,n)=0
% 24   I10_11(n)-I11_12(n)=0  ->  x(33,n)-x(34,n)=0
% 25   I10_13-I13_14=0  ->  x(36,n)-x(37,n)=0
% 26   (2*h)/(3*L10)(v13(n)-v14(n))-I13_14(n)=-4/3*I13_14(n-1)+1/3*I13_14(n-2)  ->  (2*h)/(3*L10)(x(13,n)-x(14,n))-x(37,n)=-4/3*x(37,n-1)+1/3*x(37,n-2) 
% 27   v10(n)-v13(n)-I10_13(n)*R0=0  ->  x(10,n)-x(13,n)-x(36,n)*R0=0
% 28   I6_10(n)-I10_11(n)-I10_13(n)-I10_15(n)=0  ->  x(32,n)-x(33,n)-x(36,n)-x(35,n)=0
% 29   (2*h)/(3*L5)(v10(n)-v15(n))-I10_15(n)=-4/3*I10_15(n-1)+1/3*I10_15(n-2)  ->  (2*h)/(3*L5)(x(10,n)-x(15,n))-x(35,n)=-4/3*x(35,n-1)+1/3*x(35,n-2)
% 30   I10_15(n)+I16_15(n)-I15_18(n)-I15_22(n)-I15_20=0  ->
% x(35,n)+x(39,n)-x(40,n)-x(44,n)-x(42,n)=0
% 31   v17(n)=0  ->  x(17,n)=0
% 32   I17_16(n)=i1_t(n)  ->  x(38,n)=i1_t(n)
% 33   I17_16(n)-I16_15(n)=0  ->  x(38,n)-x(39,n)=0
% 34   (2*h)/(3*L1)(v16(n)-v15(n))-I16_15(n)=-4/3*I16_15(n-1)+1/3*I16_15(n-2)  ->  (2*h)/(3*L1)(x(16,n)-x(15,n))-x(39,n)=-4/3*x(39,n-1)+1/3*x(39,n-2)
% 35   v19(n)=0  ->  x(19,n)=0
% 36   v21(n)=0  ->  x(21,n)=0
% 37   I15_22=0  ->  x(44,n)=0
% 38   I15_18(n)-I18_19(n)=0  ->  x(40,n)-x(41,n)=0
% 39   I15_20(n)-I20_21(n)=0  ->  x(42,n)-x(43,n)=0
% 40   (2*h)/(3*L11)(v18(n)-v19(n))-I18_19(n)=-4/3*I18_19(n-1)+1/3*I18_19(n-2)  ->  (2*h)/(3*L11)(x(18,n)-x(19,n))-x(41,n)=-4/3*x(41,n-1)+1/3*x(41,n-2) 
% 41   (2*h)/(3*L12)(v20(n)-v21(n))-I20_21(n)=-4/3*I20_21(n-1)+1/3*I20_21(n-2)  ->  (2*h)/(3*L12)(x(20,n)-x(21,n))-x(43,n)=-4/3*x(43,n-1)+1/3*x(43,n-2) 
% 42   (2*h)/(3*L6)(v15(n)-v22(n))-I15_22(n)=-4/3*I15_22(n-1)+1/3*I15_22(n-2)  ->  (2*h)/(3*L6)(x(15,n)-x(22,n))-x(44,n)=-4/3*x(44,n-1)+1/3*x(44,n-2) 
% 43   v15(n)-v20(n)-I15_20(n)*R1=0  ->  x(15,n)-x(20,n)-x(42,n)*R1=0
% 44   v15(n)-v18(n)-2*h*RB/(2*h+3CB*RB)*I15_18=-2*h*RB/(2*h+3CB*RB)*(2.5*Ic*sin(4/3*phi_3(n-1)_1/3*phi_3(n-2)+2*pi/PHI_0*2*h/3*(2.5*(v15(n-1)-v18(n-1))-2*(v15(n-2)-v18(n-2))+0.5*(v15(n-3)-v18(n-3))))-2*CB/h*(v15(n-1)-v18(n-1))+CB/2/h*(v15(n-2)-v18(n-2)))
%      x(15,n)-x(18,n)-2*h*RB/(2*h+3CB*RB)*x(40,n)=2*h*RB/(2*h+3CB*RB)*(2.5*Ic*sin(4/3*x(47,n-1)-1/3*x(47,n-2)+2*pi/PHI_0*2*h/3*(2.5*(x(15,n-1)-x(18,n-1))-2*(x(15,n-2)-x(18,n-2))+0.5*(x(15,n-3)-x(18,n-3))))-2*CB/h*(x(15,n-1)-x(18,n-1))+CB/2/h*(x(15,n-2)-x(18,n-2)))
%45
%v5(n)-v6(n)-PHI_0/2/pi*1.5/h*phi_1(n)=-PHI_0/(pi*h)*phi_1(n-1)+PHI_0/(4*pi*h)*phi_1(n-2)
%-> x(5,n)-x(6,n)-PHI_0/2/pi*1.5/h*x(45,n)=-PHI_0/(pi*h)*x(45,n-1)+PHI_0/(4*pi*h)*x(45,n-2)
%46
%v10(n)-v11(n)-PHI_0/2/pi*1.5/h*phi_2(n)=-PHI_0/(pi*h)*phi_2(n-1)+PHI_0/(4*pi*h)*phi_2(n-2)
%-> x(10,n)-x(11,n)-PHI_0/2/pi*1.5/h*x(46,n)=-PHI_0/(pi*h)*x(46,n-1)+PHI_0/(4*pi*h)*x(46,n-2)
%47
%v15(n)-v18(n)-PHI_0/2/pi*1.5/h*phi_3(n)=-PHI_0/(pi*h)*phi_3(n-1)+PHI_0/(4*pi*h)*phi_3(n-2)
%-> x(15,n)-x(18,n)-PHI_0/2/pi*1.5/h*x(47,n)=-PHI_0/(pi*h)*x(47,n-1)+PHI_0/(4*pi*h)*x(47,n-2)
%parameter
    %simulate from T_MIN=0 to T_MAX=1200p, h=0.25ps
    T_MAX=1200E-12;
    T_MIN=0;
    h=0.25E-12; 
   
    % 需要解得number 组解
    number=(T_MAX-T_MIN)/h+1;
    %预先给解分配空间，其中前三列均为0
    x=zeros(47,number+2);

    R0=3.048846408;
    R1=2.743961767;
    R2=3.048846408;
    L0=0.2E-12;
    L1=0.2E-12;
    L2=1E-12;
    L3=0.6E-12;
    L4=1.1E-12;
    L5=4.5E-12;
    L6=2E-12;
    L7=3.9E-12;
    L8=1E-12;
    L9=0.2E-12;
    L10=1E-12;
    L11=0.2E-12;
    L12=1E-12;
    PHI_0=2.067833848E-15;
    Ic=100E-6;
    RB=16;
    CB=0.07E-12;
    
    %number=4801
    i0_t=zeros(1,number+2);
    i1_t=zeros(1,number+2);
    i2_t=zeros(1,number+2);
    for i=3: number+2
        if i==3 
            i0_t(i)=0;
        end
        if i==4 
            i0_t(i)=0.5*275E-6;
        end
        if i>4
            i0_t(i)=275E-6;
        end
    end
    
    for i=3: number+2
        if i==3 
            i1_t(i)=0;
        end
        if i==4 
            i1_t(i)=0.5*175E-6;
        end
        if i>4
            i1_t(i)=175E-6;
        end
    end
    
    for i=3:number+2
        if mod(i-3, 800)<400
            i2_t(i)=1.5E-6*mod(i-3, 800);
        else
            i2_t(i)=-1.5E-6*mod(i-3, 800)+1200E-6;
        end
    end
   
%求解
for n=4: number+2
    clear b
    clear x_test
    clear A
    %构建A矩阵
    A=zeros(47,47);
    A(1,1)=1;
    A(2,23)=1;
    A(3,2)=(2*h)/(3*L2); A(3,3)=-(2*h)/(3*L2); A(3,24)=-1;
    A(4,4)=1;
    A(5,3)=(2*h)/(3*L3);  A(5,5)=-(2*h)/(3*L3); A(5,26)=-1;
    A(6,3)=(2*h)/(3*L7);  A(6,4)=-(2*h)/(3*L7); A(6,25)=-1;
    A(7,23)=1; A(7,24)=-1;
    A(8,24)=1; A(8,25)=-1; A(8,26)=-1;
    A(9,5)=1; A(9,7)=-1; A(9,28)=-R2;
    A(10,26)=1; A(10,27)=-1; A(10,28)=-1;
    A(11,28)=1; A(11,29)=-1;
    A(12,7)=(2*h)/(3*L8);  A(12,6)=-(2*h)/(3*L8); A(12,29)=-1;

    A(14,30)=1;A(14,27)=1;A(14,29)=1;A(14,32)=-1;
    A(15,8)=(2*h)/(3*L0);  A(15,6)=-(2*h)/(3*L0); A(15,30)=-1;
    A(16,31)=1;A(16,30)=-1;
    A(17,9)=1;
    A(18,31)=1;
    A(19,6)=(2*h)/(3*L4);  A(19,10)=-(2*h)/(3*L4); A(19,32)=-1;

    A(21,11)=(2*h)/(3*L9);  A(21,12)=-(2*h)/(3*L9); A(21,34)=-1;
    A(22,12)=1;
    A(23,14)=1;
    A(24,33)=1;A(24,34)=-1;
    A(25,36)=1;A(25,37)=-1;
    A(26,13)=(2*h)/(3*L10);  A(26,14)=-(2*h)/(3*L10); A(26,37)=-1;
    A(27,10)=1; A(27,13)=-1; A(27,36)=-R0;
    A(28,32)=1;A(28,33)=-1;A(28,36)=-1;A(28,35)=-1;
    A(29,10)=(2*h)/(3*L5);  A(29,15)=-(2*h)/(3*L5); A(29,35)=-1;
    A(30,35)=1;A(30,39)=1;A(30,40)=-1;A(30,44)=-1;A(30,42)=-1;
    A(31,17)=1;
    A(32,38)=1;
    A(33,38)=1;A(33,39)=-1;
    A(34,16)=(2*h)/(3*L1);  A(34,15)=-(2*h)/(3*L1); A(34,39)=-1;
    A(35,19)=1;
    A(36,21)=1;
    A(37,44)=1;
    A(38,40)=1;A(38,41)=-1;
    A(39,42)=1;A(39,43)=-1;
    A(40,18)=(2*h)/(3*L11);  A(40,19)=-(2*h)/(3*L11); A(40,41)=-1;
    A(41,20)=(2*h)/(3*L12);  A(41,21)=-(2*h)/(3*L12); A(41,43)=-1;
    A(42,15)=(2*h)/(3*L6);  A(42,22)=-(2*h)/(3*L6); A(42,44)=-1;
    A(43,15)=1; A(43,20)=-1; A(43,42)=-R1;


    b=zeros(47,1);
    b(1)=0;
    b(2)=i2_t(n);
    b(3)=-4/3*x(24,n-1)+1/3*x(24,n-2);
    b(4)=0;
    b(5)=-4/3*x(26,n-1)+1/3*x(26,n-2);
    b(6)=-4/3*x(25,n-1)+1/3*x(25,n-2);
    b(7)=0;
    b(8)=0;
    b(9)=0;
    b(10)=0;
    b(11)=0;
    b(12)=-4/3*x(29,n-1)+1/3*x(29,n-2);
    A(13,5)=1;A(13,6)=-1;A(13,27)=-2*h*RB/(2*h+3*CB*RB);
    A(45,5)=1;A(45,6)=-1;A(45,45)=-PHI_0/2/pi*1.5/h;
    b(13)=-2*h*RB/(2*h+3*CB*RB)*(2.25*Ic*sin(4/3*x(45,n-1)-1/3*x(45,n-2)+2*pi/PHI_0*2*h/3*(2.5*(x(5,n-1)-x(6,n-1))-2*(x(5,n-2)-x(6,n-2))+0.5*(x(5,n-3)-x(6,n-3))))-2*CB/h*(x(5,n-1)-x(6,n-1))+CB/2/h*(x(5,n-2)-x(6,n-2)));
    b(45)=-PHI_0/(pi*h)*x(45,n-1)+PHI_0/(4*pi*h)*x(45,n-2);
    b(14)=0;
    b(15)=-4/3*x(30,n-1)+1/3*x(30,n-2);
    b(16)=0;
    b(17)=0;
    b(18)=i0_t(n);
    b(19)=-4/3*x(32,n-1)+1/3*x(32,n-2);
    A(20,10)=1; A(20,11)=-1;A(20,33)=-2*h*RB/(2*h+3*CB*RB);
    A(46,10)=1;A(46,11)=-1;A(46,46)=-PHI_0/2/pi*1.5/h;
    b(46)=-PHI_0/(pi*h)*x(46,n-1)+PHI_0/(4*pi*h)*x(46,n-2);
    b(20)=-2*h*RB/(2*h+3*CB*RB)*(2.25*Ic*sin(4/3*x(46,n-1)-1/3*x(46,n-2)+2*pi/PHI_0*2*h/3*(2.5*(x(10,n-1)-x(11,n-1))-2*(x(10,n-2)-x(11,n-2))+0.5*(x(10,n-3)-x(11,n-3))))-2*CB/h*(x(10,n-1)-x(11,n-1))+CB/2/h*(x(10,n-2)-x(11,n-2)));
    b(21)=-4/3*x(34,n-1)+1/3*x(34,n-2);
    b(22)=0;
    b(23)=0;
    b(24)=0;
    b(25)=0;
    b(26)=-4/3*x(37,n-1)+1/3*x(37,n-2);
    b(27)=0;
    b(28)=0;
    b(29)=-4/3*x(35,n-1)+1/3*x(35,n-2);
    b(30)=0;
    b(31)=0;
    b(32)=i1_t(n);
    b(33)=0;
    b(34)=-4/3*x(39,n-1)+1/3*x(39,n-2);
    b(35)=0;
    b(36)=0;
    b(37)=0;
    b(38)=0;
    b(39)=0;
    b(40)=-4/3*x(41,n-1)+1/3*x(41,n-2);
    b(41)=-4/3*x(43,n-1)+1/3*x(43,n-2);
    b(42)=-4/3*x(44,n-1)+1/3*x(44,n-2);
    b(43)=0;
    A(44,15)=1;A(44,18)=-1;A(44,40)=-2*h*RB/(2*h+3*CB*RB);
    A(47,15)=1;A(47,18)=-1;A(47,47)=-PHI_0/2/pi*1.5/h;
    b(47)=-PHI_0/(pi*h)*x(47,n-1)+PHI_0/(4*pi*h)*x(47,n-2);
    b(44)=-2*h*RB/(2*h+3*CB*RB)*(2.5*Ic*sin(4/3*x(47,n-1)-1/3*x(47,n-2)+2*pi/PHI_0*2*h/3*(2.5*(x(15,n-1)-x(18,n-1))-2*(x(15,n-2)-x(18,n-2))+0.5*(x(15,n-3)-x(18,n-3))))-2*CB/h*(x(15,n-1)-x(18,n-1))+CB/2/h*(x(15,n-2)-x(18,n-2)));

    x_test=A\b;
    for i=1:47
        x(i,n)=x_test(i);
    end
end
figure(1)
subplot(2,2,1);
plot(i2_t)
subplot(2,2,2);
plot(x(2,:))
subplot(2,2,3);
plot(x(47,:))
subplot(2,2,4);
plot(x(22,:))

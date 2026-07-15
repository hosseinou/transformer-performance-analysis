clc;clear;close all;
R1=10;
n=0;
Is=0;
Vs=0;
Ip=0;
Vp=7350;
eff=[];
SL=[];
ST=250000;

for R1=50:10:500
    simout=sim('trans1');
    a=simout.get('a'); 
    simout1=sim('trans1');
    a1=simout.get('a1');
    simout2=sim('trans1');
    a2=simout.get('a2');
%     simout3=sim('trans1');
%     a3=simout.get('a3');
    Is=a(5000,1);
    Vs=a1(5000,1);
    Ip=a2(5000,1);
%     Vp=a3(20000,1);
    Pout=Is*Vs;
    n=Pout/(Ip*Vp);
    eff=[eff n];
    SL=[SL (Pout/ST)]
end
%R1=10:50:1000
grid
plot(SL,eff)
clc;clear;close all;
R=10;
C=0;
L=0;
X=0;
S=250000;
v2=3150;
i2=S/v2;
f=50;
Req=0.15876;
Xeq=5.289;
VR=[];
% simout=sim('trans');
% a=simout.get('a');
for Teta=-90:5:90
    T=(Teta*2*pi)/360;
    if T<0
        R=(v2/(i2))*cos(T);
        X=(v2/(i2))*sin(T);
        C=-1/(X*2*pi*f);
        L=0;
    elseif T>0
            R=(v2/(i2))*cos(T);
            X=(v2/(i2))*sin(T);
            L=X/(2*pi*f);
            C=0;
        else
            R=v2/i2;
            C=0;
            L=0;
    end
    simout=sim('trans');
    a=simout.get('a');
    il=a(20000,1);
    vr=(Req*il*cos(T)+Xeq*il*sin(T))/v2;
    VR=[VR vr];
end
Teta=-90:5:90;
plot(Teta,VR)

% clc;clear;close all;
% R=10;
% C=0;
% L=0;
% X=0;
% S=250000;
% v2=3150;
% i2=S/v2;
% f=50;
% VR=[];
% % simout=sim('trans');
% % a=simout.get('a');
% for Teta=-90:5:90
%     T=(Teta*2*pi)/360;
%     if T<0
%         R=(v2/(i2))*cos(T);
%         X=(v2/(i2))*sin(T);
%         C=-1/(X*2*pi*f);
%         L=0;
%     elseif T>0
%             R=(v2/(i2))*cos(T);
%             X=(v2/(i2))*sin(T);
%             L=X/(2*pi*f);
%             C=0;
%         else
%             R=v2/i2;
%             C=0;
%             L=0;
%     end
%     simout=sim('trans');
%     a=simout.get('a');
%     Vfl=a(20000,1)
%     V=(v2-Vfl)/Vfl;
%     VR=[VR V]
% end
% Teta=-90:5:90;
% plot(Teta,VR)
% grid on
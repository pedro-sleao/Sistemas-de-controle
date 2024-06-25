
P=struct('x2',0,'x1',0,'x0',0,'a2',2,'a1',4,'a0',2,...
         'y2',0,'y1',0,'y0',0,'b2',39921,'b1',-79998,'b0',40081,...
         'ymax',1000,'ymin',-1000)
A=struct('x2',0,'x1',0,'x0',0,'a2',1,'a1',1,'a0',1,...
         'y2',0,'y1',0,'y0',0,'b2',1,'b1',1,'b0',1,...
         'ymax',1000,'ymin',-1000)

function [y, param]=processo(param,x)
    param.x2=param.x1;
    param.x1=param.x0;
    param.x0=x;
    
    param.y2=param.y1;
    param.y1=param.y0;
    
    
    y=param.a2*param.x2+param.a1*param.x1+param.a0*param.x0;
    y=(1/param.b0)*(y-(param.b2*param.y2+param.b1*param.y1));
    
    //Saturação
    if y>param.ymax then
        y=param.ymax
    elseif y<param.ymin then
        y=param.ymin
    end
    
    param.y0=x;
    
endfunction

P.a2=2; P.a1=4; P.a0=2;
P.b2=39921; P.b1=-79998; P.b0=40081;
A.a2=2; A.a1=2; A.a0=0;
A.b2=-19; A.b1=21; A.b0=0;
A.ymax=2
A.ymin=0

a=0
N=3000
y=zeros(1,N)
t=zeros(1,N)
dt=0.01
y0=0
Kp=1
Ki=0
Kd=0
m=0
for i=1:N
    t(i)=dt*i
    e2=e1
    e1=e0
    e0=SP-y
    m=m+Kp*(e0-e1)+Ki*e0+Kd*(e0-2*e1+e2)
    [a,A]=processo(A,1)
    [y0,P]=processo(P,a)
    y(i)=y0
end

plot(t,y)
plot(30,4)

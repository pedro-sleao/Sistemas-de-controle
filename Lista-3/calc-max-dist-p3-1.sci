chdir("C:\Users\pedro\OneDrive\Área de Trabalho\2024.1\Sistemas-de-controle\Lista-3")
loadXcosLibs(); loadScicos();

importXcosDiagram("ex2024-1-p3-1.zcos")

typeof(scs_m)

dist = 0;
dmax = 0;
cnt=0;
a = 30;
ds = zeros(1,89);

while a < 45 
    scs_m.props.context(5)="a=a";
    scicos_simulate(scs_m);
    plot(xvfyv.values(:,1),xvfyv.values(:,2),'r-');
    dist=xvfyv.values($,1);
    if dist > dmax
        dmax = dist;
    end
    printf("angulo=%f distancia=%f\n", a, dist);
    cnt=cnt+1;
    a=a+0.2;
    ds(cnt) = dist
end

printf("dmax = %f", dmax);

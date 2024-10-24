import math;
import graph3;
import three;
import solids;
size(0,300);

currentprojection=orthographic(-1,.5,1,up=Y);
currentprojection=orthographic(0,0,1,up=Y);
currentlight=light((-1,1,1),(1,1,1));
currentlight.background=white;

pen p=linewidth(0.2mm);
pen c2=rgb(255,64,0);
real r=1;
real h=.15;

// Dibujo del cilindro
revolution R=cylinder(-h/2*Z,r,h);
draw(surface(R),c2+opacity(.5),render(compression=High));
draw(shift(0,0,h/2)*unitdisk,c2+opacity(.5),render(compression=Low));
draw(shift(0,0,-h/2)*unitdisk,c2+opacity(.5),render(compression=Low));
path3 c=circle((0,0,0), r, Z);
draw(shift(0,0,h/2)*c);
draw(shift(0,0,-h/2)*c);

//Dibujar ejes cartesianos
real aS=1.25;
draw(Label("$x$",EndPoint),-aS*X--aS*X,p+gray,Arrow3);
draw(Label("$y$",EndPoint),-aS*Y--aS*Y,p+gray,Arrow3);
draw(Label("$z$",EndPoint),-aS*Z--aS*Z,p+gray,Arrow3);

// Arco para indicar la direccion de la rotación
path3 g=shift(0,0,.75*aS)*arc(O,.1,90,360,90,0);
draw(Label("$\omega$",EndPoint,align=3NE),g,gray,Arrow3(DefaultHead3,position=Relative(0.5)),currentlight);
draw(g,gray,Arrow3(DefaultHead3,position=Relative(1)),currentlight);



//label("$\alpha$",(-1.2*aS,0,0));

// Puntos sobre el circulo unitario
triple f(real t) {return(cos(t),sin(t),0);}
triple origin = (0,0,0);
real ang1 = 135*pi/180;
real ang2 = 100*pi/180;
real ang4 = -30*pi/180;
real ang5 = 15*pi/180;
real ang6 = 250*pi/180;
// Dibujar llos vectores en un punto específico
triple t0 = f(ang1); 
triple t1 = 2*f(ang2); 

triple t2 = 2*f(ang1+ang2); 
triple t3 = 2.5*f(ang1); 
triple t4 = f(ang4);
triple t5 = 1.75*f(ang5);
triple t6 = f(ang6);
triple t7 = 1.5*f(ang6+.25*ang5);
path3 r=shift(t0)*(origin--t0);


draw(Label("$\vec{\tau}$",EndPoint),origin-- -1*Z, red+linewidth(2), Arrow3(size=5));
dot(t0);

draw(Label("$\vec{r}$",MidPoint),origin--t0, green+linewidth(2), Arrow3(size=5));
//draw(r);
draw(Label("$\vec{F}$",EndPoint),t0--t1, black+linewidth(2), Arrow3(size=5));

path3 h=shift(t0)*arc(O,.2,90,-45,90,75);
//draw(Label("$\theta$",MidPoint),h,cyan,Arrow3(DefaultHead3,position=Relative(0.5)),currentlight);

//draw(Label("l\'inea de acci\'on de la fuerza",MidPoint,align=5NW-N),t0--t2, black+linewidth(.5)+dashed);
//draw(Label("direcci\'on de $\vec{r}$",MidPoint,align=5W),origin--t3, blue+linewidth(.5)+dashed, Arrow3(size=5));

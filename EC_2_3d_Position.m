[x,y]=meshgrid(-2:0.1:2,-2:0.1:2);
z=1./sqrt(x.^2+(y-1).^2+0.01)-1./sqrt(x.^2+(y+1).^2+0.01);
surfl(x,y,z);
shading interp;
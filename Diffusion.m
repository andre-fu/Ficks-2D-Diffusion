clear; clc;
[X, Y] = meshgrid(-100:1:100);                                              %domain
D = 6*(10^(-5));
nt = 50000;
tf = 1000000;
t = [1:nt:tf];%the time step 
apec = csvread('APEC.csv');                                                 %the (x, y) locations  of diffusivity - 29 locations 
C = NaN(201, 201, (tf/nt));                                                      %concentration (x, y, each of the locations)
for i = 1:(tf/nt)
    C_timestep = NaN(201,201,18);
    for j = 1:18
        C_timestep(:,:,j) = FicksDiffusion_2D(apec(j,1), apec(j, 2), X, Y, t(i) , D); 
    end
    C_sum  = NaN(201, 201); 
    C_sum = sum(C_timestep, 3);                                              %average along the locations, giving the curves
    C(:,:,i) = C_sum(:,:);
end

surf(X,Y, C(:,:,20))
title ('Concentration in 2D Diffusion')
xlabel('x dimension (m)')
ylabel('y dimension (m)')
zlabel('Concentration (M)')

%for k = 1:(tf/nt)
%    p = surf(X, Y, C(:,:,k));
%    saveas(p, sprintf('diff_%d.png', k) );
%end
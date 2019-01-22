% Displacement check
clear all
close all
clc

displacements = importdata('../Cases/LinearLatticetest.txt');

figure
plot(displacements(:,4000))
mass = 1;
timestep = 0.01;

[E,v1,v2] = EnergyVelocity(displacements,mass,timestep);
figure
for i = 1:length(displacements(10,:))/10
    plot(displacements(:,10*i))
    xlabel('Nodal position [n]')
    ylabel('Displacements [u(n)]')
    axis([0,600,-1,5])
    pause(0.01)
end
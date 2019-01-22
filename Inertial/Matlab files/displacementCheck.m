% Displacement check
clear all
close all
clc

displacements = importdata('../Cases/MagneticLatticeDiffusive.txt');

figure
plot(displacements(:,6000),'linewidth',2)
axis([0,600,-0.1,2.1])
set(gca,'fontsize', 24);
xlabel('Nodal position')
ylabel('Displacements')

mass = 0.001;
timestep = 0.01;
t1 = 100;
t2 = 1100;

[E,v,pvel] = EnergyVelocity(displacements,mass,timestep,t1,t2);
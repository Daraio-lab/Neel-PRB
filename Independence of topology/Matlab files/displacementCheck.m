% Displacement check
clear all
close all
clc

displacements = importdata('../Cases/HyperelasticLatticeDiffusiveTopology1.txt');

figure
plot(displacements(:,4000),'linewidth',2)
axis([0,600,-0.1,2.1])
set(gca,'fontsize', 24);
xlabel('Nodal position')
ylabel('Displacements')

mass = 1;
timestep = 0.01;

[E,v] = EnergyVelocity(displacements,mass,timestep);
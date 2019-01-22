% Displacement check
clear all
close all
clc

displacements1 = importdata('../Cases/LinearSuperposition/LinearLatticeMultiStableDelta11.txt');
displacements2 = importdata('../Cases/LinearSuperposition/LinearLatticeMultiStableDelta20.txt');
displacements3 = importdata('../Cases/LinearSuperposition/LinearLatticeMultiStableDelta02.txt');

x = 0:length(displacements1(:,1))-1;

figure
plot(x,displacements1(:,6000),'b',x,displacements2(:,2000),'k-.',x,displacements3(:,5000),'r--','linewidth',2)
set(gca,'fontsize', 24);
axis([0,600,-0.1,4.1])
xlabel('Nodal position')
ylabel('Displacements')
legend('topology 1','topology 2','topology 3')
mass = 1;
timestep = 0.01;

%[E,v1,v2] = EnergyVelocity(displacements,mass,timestep);
% figure
% for i = 1:length(displacements(10,:))/10
%     plot(displacements(:,10*i))
%     xlabel('Nodal position [n]')
%     ylabel('Displacements [u(n)]')
%     axis([0,600,0,5])
%     pause(0.01)
% end
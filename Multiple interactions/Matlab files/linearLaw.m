clc
close all
clear all

displacements1 = importdata('../Cases/LinearLatticeMultiInteraction1.txt');
displacements2 = importdata('../Cases/LinearLatticeMultiInteraction2.txt');
displacements3 = importdata('../Cases/LinearLatticeMultiInteraction3.txt');
displacements4 = importdata('../Cases/LinearLatticeMultiInteraction4.txt');
displacements5 = importdata('../Cases/LennardJonesLatticeMultiInteraction1.txt');
displacements6 = importdata('../Cases/LennardJonesLatticeMultiInteraction2.txt');

x = 0:length(displacements1(:,1))-1;

E = zeros(6,1);
v = zeros(6,1);

timestep = 0.01;
mass = 1;

for n = 1:length(E)
   [E(n), v(n)] = EnergyVelocity(eval(sprintf('displacements%d',n)),mass,timestep); 
end

rhovel = 0:0.001:30;

deltapsi = 2.;
gamma = 1.;

markers = '+ov*^s';

figure
hold on
for i = 1:length(E)
    plot(v(i),E(i),markers(i),'markersize',10,'LineWidth',2)
end
plot(rhovel,deltapsi/(2*gamma)*rhovel,'r','LineWidth',2)
set(gca,'fontsize', 24);
xlabel('Velocity (v)')
ylabel('Energy per density (E)')
axis([0,25,0,25])
h_legend=legend('Linear 1st neigbor','Linear 2nd neigbor','Linear 3rd neigbor','Linear 4th neigbor', 'LJ 1st neighbor', 'LJ 2nd neighbor');
set(h_legend,'FontSize',16)
clc
close all
% clear all
% 
% displacements1 = importdata('../Cases/HyperelasticLatticeGamma1Topology1.txt');
% displacements2 = importdata('../Cases/HyperelasticLatticeGamma1Topology2.txt');
% displacements3 = importdata('../Cases/HyperelasticLatticeGamma1Topology3.txt');
% displacements4 = importdata('../Cases/LinearLatticeGamma1Topology1.txt');
% displacements5 = importdata('../Cases/LinearLatticeGamma1Topology2.txt');
% displacements6 = importdata('../Cases/LinearLatticeGamma1Topology3.txt');
% displacements7 = importdata('../Cases/LennardJonesLatticeGamma1Topology1.txt');
% displacements8 = importdata('../Cases/LennardJonesLatticeGamma1Topology2.txt');
% displacements9 = importdata('../Cases/LennardJonesLatticeGamma1Topology3.txt');

x = 0:length(displacements1(:,1))-1;

E = zeros(9,1);
v = zeros(9,1);

timestep = 0.01;
mass = 1;

for n = 1:length(E)
   [E(n), v(n)] = EnergyVelocity(eval(sprintf('displacements%d',n)),mass,timestep); 
end

rhovel = 0:0.001:30;

deltapsi = 2.;
gamma = 1.;

markers = '+ov*xs^dp';

figure
hold on
for i = 1:length(E)
    plot(v(i),E(i),markers(i),'markersize',10,'LineWidth',2)
end
plot(rhovel,deltapsi/(2*gamma)*rhovel,'r','LineWidth',2)
xlabel('Momentum density (\rhov)')
ylabel('Equilibrium energy (E)')
axis([0,11,0,11])
legend('Hyperelastic/Topology 1','Hyperelastic/Topology 2','Hyperelastic/Topology 3','Linear/Topology 1', 'Linear/Topology 2','Linear/Topology 3', 'Lennard-Jones/Topology 1', 'Lennard-Jones/Topology 2','Lennard-Jones/Topology 3','theory')
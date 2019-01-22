clc
close all
clear all

displacements1 = importdata('../Cases/HyperelasticLatticeGamma1Topology1.txt');
displacements2 = importdata('../Cases/HyperelasticLatticeGamma1Topology2.txt');
displacements3 = importdata('../Cases/HyperelasticLatticeGamma1Topology3.txt');
displacements4 = importdata('../Cases/LinearLatticeGamma1Topology1.txt');
displacements5 = importdata('../Cases/LinearLatticeGamma1Topology2.txt');
displacements6 = importdata('../Cases/LinearLatticeGamma1Topology3.txt');
displacements7 = importdata('../Cases/MagneticLatticeGamma1Topology1.txt');
displacements8 = importdata('../Cases/MagneticLatticeGamma1Topology2.txt');
displacements9 = importdata('../Cases/MagneticLatticeGamma1Topology3.txt');

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
set(gca,'fontsize', 28);
xlabel('Velocity (v)')
ylabel('Energy per density (E)')
axis([0,11,0,11])
h_legend=legend('hyperelastic/topology 1','hyperelastic/topology 2','hyperelastic/topology 3','linear/topology 1', 'linear/topology 2','linear/topology 3', 'dipole/topology 1', 'dipole/topology 2','dipole/topology 3','theory');
set(h_legend,'FontSize',16)
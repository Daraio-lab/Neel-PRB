clc
close all
clear all

displacements1 = importdata('../Cases/LinearLatticeGamma1Topology1.txt');
displacements2 = importdata('../Cases/HyperelasticLatticeDiffusive.txt');
displacements3 = importdata('../Cases/CoulombLatticeGamma1Topology1.txt');
displacements4 = importdata('../Cases/MagneticLatticeDiffusive.txt');
displacements5 = importdata('../Cases/TodaLatticeGamma1Topology1.txt');
displacements6 = importdata('../Cases/TodaLatticeDiffusive.txt');

x = 0:length(displacements1(:,1))-1;

E = zeros(6,1);
v = zeros(6,1);

timestep = 0.01;
t1 = [2000,100,1000,1000,1000,1000];
t2 = [3000,1100,2000,2000,2000,2000];

for n = 1:length(E)
   [E(n), v(n)] = EnergyVelocity(eval(sprintf('displacements%d',n)),timestep,t1(n),t2(n)); 
end

rhovel = 0:0.001:32;

deltapsi = 2.;
gamma = 1.;

markers = '+ov*xs';

figure
hold on
for i = 1:length(E)
    plot(v(i),E(i),markers(i),'markersize',10,'LineWidth',2)
end
plot(rhovel,deltapsi/(2*gamma)*rhovel,'r','LineWidth',2)
set(gca,'fontsize', 28);
xlabel('Velocity (v)')
ylabel('Energy per density (E)')
axis([0,31,0,31])
h_legend=legend('linear (dissipative)','hyperelastic (diffusive)','coulomb (dissipative)','dipole (diffusive)', 'toda (dissipative)','toda (diffusive)','theory');
set(h_legend,'FontSize',16)
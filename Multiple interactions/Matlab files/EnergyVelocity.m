function [E, rhov1, rhov2] = EnergyVelocity(displacements,mass,timestep)
x = 0:length(displacements(:,1))-1;
time = timestep*(0:length(displacements(1,:))-1);

% figure
% plot(time, displacements(80,:))

En = zeros(length(x),1);

pvelocity = zeros(length(x),length(time)-1);

for i=1:length(displacements(1,:))-1
    pvelocity(:,i) = (displacements(:,i+1)-displacements(:,i))/timestep;
end

index1 = zeros(1,length(displacements(1,:)));
index2 = zeros(1,length(displacements(1,:)));

for k=1:length(index1)
    [idx1, idx1] = min(abs(displacements(:,k)-0.9));
    [idx2, idx2] = min(abs(displacements(:,k)-1.9));
    index1(k) = idx1;
    index2(k) = idx2;
end
figure
plot(index1,'r')
hold on
plot(index2,'b')
hold off

t = timestep*(1000:2000);

vel1 = polyfit(t,index1(1000:2000),1);
vel2 = polyfit(t,index2(1000:2000),1);

for j=1:length(time)-1
    En(j) = 0.5*mass*trapz(pvelocity(:,j).^2);
end
figure
plot(En)

E = mean(En(1000:2000));

rhov1 = mass*vel1(1);
rhov2 = mass*vel2(1);

end
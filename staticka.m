% zadani signal: f(x)=e-2sin2(x) sin(5x);
P=-4:0.01:4;
T0=exp(-2*sin(x).^2).*sin(5*x); % signal
T=T0+0.05*randn(size(P)); % signal sa šumom
net=newff([-4 4],[30 1],{'tansig','purelin'},'traincgf');

net.trainParam.show=100;
net.trainParam.epochs=2000;
net.trainParam.goal=2e-4;

[net,tr]=train(net,P,T);
a=sim(net,P);
figure(1)
plot(P,T0,P,T,':r','linewidth',2);
legend('signal','signal sa šumom');
figure(2)
plot(P,T,':r',P,a,'b','linewidth',2);
legend('signal sa šumom','neuronska mreza');
figure(3)
plot(P,T0,P,a,':g','linewidth',2);
legend('signal','neurosnka mreza');
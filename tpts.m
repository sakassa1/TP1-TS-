clear all
close all
clc

%Partie 1-----------------------------------------------------------------------------------------------------------------------------------

Te=1/50; 
fe=50;

t=0:Te:10-Te;
N=length(t);
figure(1);
%s un signal périodique x(t) constitué d’une somme de deux sinusoïdes de fréquences 15Hz et 20Hz
x=sin(2*pi*15*t)+sin(2*pi*20*t);
subplot(3,2,1);
%sound(x);
plot(t,x);
title('signal periodique');
%TFD du signal x(t) en utilisant la commande fft
F=abs(fft(x));
f=(0:N-1)*(fe/N);
subplot(3,2,2);
plot(f,F);
title('TFD');
%Pour mieux visualiser le contenu fréquentiel du signal,on utilise la fonction fftshift
subplot(3,2,3);
fshift=(-N/2:(N/2)-1)*(fe/N);
plot(fshift,fftshift(F));
title('TFD centré à zero');

% randn pour générer un xnoice (bruit)
xnoise=x+2*randn(size(t));

subplot(3,2,4);
plot(t,xnoise);
title('xnoise');

% le spectre de puissance du signal bruité centré à la fréquence zéro
Fnoise=abs(fft(xnoise));
subplot(3,2,5);
plot(fshift,fftshift(Fnoise.^2));
title('TFD du bruit');

DS=(Fnoise.^2)/N;
subplot(3,2,6);
plot(fshift,fftshift(DS));
title('densité spectrale de puissance');



%Partie 2----------------------------------------------------------------------------------





figure(2);
whaleFile = fullfile(matlabroot,'examples','matlab','data','bluewhale.au');
[w,ft] = audioread(whaleFile);
chant=w(2.45e4:3.10e4);
subplot(2,1,1);
%soundsc(w,fs);

Nchant=length(chant);
t=[0:Nchant-1]*1/ft;
plot(t,chant);
title('courbe du signal bluewhale');

%la densité spectrale de puissance du signal
fshift=[-Nchant/2:Nchant/2-1]*(ft/Nchant)/10;
DSP=abs(fft(chant).^2/Nchant);
subplot(2,1,2);
plot(fshift,fftshift(DSP));
title('la densité spectrale de puissance du signal')





















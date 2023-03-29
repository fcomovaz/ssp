% Generador de rampa diente de sierra 
% Si ciclo de señal v_a = 60 Hz
% La rampa tendrá una frecuencia de 3 kHz

m=1000;

a=0;
Diente1 = zeros(1,m);
for i=1:m
   Diente1(i)=0.5*a;
   a=a+1;
   if (a>2)
       a = 0;
   end
end

figure
i=1:m;

plot(i,Diente1)
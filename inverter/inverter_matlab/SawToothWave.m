% Generador de rampa diente de sierra 
% Si ciclo de señal v_a = 60 Hz
% La rampa tendrá una frecuencia de 3 kHz

% samples of the signal
samples=100;
samplesArray = 0:samples-1;

% generate sawtooth wave using mod function
sawtoothSignal = 0.5 * mod(samplesArray, 3);

% plot the signal
plot(samplesArray,sawtoothSignal);

% just for VSCode
pause(15);
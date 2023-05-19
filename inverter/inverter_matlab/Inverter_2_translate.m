% Inverter
clear, close, clc;

% parameters
w = (2 * pi) / 100;
V_in = 170;
samples = 100;
time = 1:samples;

% clarke transform (code)
V_A = V_in * sin(w * time);
V_B = V_in * sin(w * time - 2 * pi / 3);
V_C = V_in * sin(w * time - 4 * pi / 3);

% get the maximum value of the vector
V_A_Max = max(V_A);

% % phase angle (ideal)
% thetaP = w*time;
% phase angle (real)
thetaP = asin(real(V_A) / real(V_A_Max));

% Calculate cumulative sum of phase angle differences
thetaP_sum = zeros(1, samples);
thetaP_sum(1) = thetaP(1);

for i = 2:samples
    % calculate the consecutive difference
    difference = abs(thetaP(i) - thetaP(i - 1));

    % make the cumulative sum
    thetaP_sum(i) = thetaP_sum(i - 1) + difference;

    if thetaP_sum(i) > 2 * pi
        thetaP_sum(i) = 0;
    end

end

% ----------------------------------------------------------
% YA EN VHDL
% ----------------------------------------------------------
% getting pulses and sextants
sextant = zeros(1, samples);
pulse1 = zeros(1, samples);
pulse2 = zeros(1, samples);
for i = 1:samples
    aux = Mask(thetaP_sum(i));
    sextant(i) = aux(1);
    pulse1(i) = aux(2);
    pulse2(i) = aux(3);
end
% ----------------------------------------------------------

% ----------------------------------------------------------
% YA EN VHDL
% ----------------------------------------------------------
% getting the sawtooth wave
sawtoothSignal = 0.25 * mod(time - 1, 5);
% creating pwm control signals
switch1 = pulse1 >= sawtoothSignal;
switch2 = ~(pulse1 >= sawtoothSignal);
% ----------------------------------------------------------


% ----------------------------------------------------------
% YA EN VHDL
% ----------------------------------------------------------
% create the pulse mask
S1t = zeros(1, samples);
S2t = zeros(1, samples);
S3t = zeros(1, samples);
S4t = zeros(1, samples);
S5t = zeros(1, samples);
S6t = zeros(1, samples);
for i = time
    aux = maskAssign(switch1(i), switch2(i), sextant(i));
    S1t(i) = aux(1);
    S2t(i) = aux(2);
    S3t(i) = aux(3);
    S4t(i) = aux(4);
    
    S5t(i) = aux(5);
    S6t(i) = aux(6);
end
% ----------------------------------------------------------

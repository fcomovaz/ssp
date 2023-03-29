% Inverter
clear, close, clc;

% parameters
w = (2 * pi) / 100;
V_in = 170;
samples = 2000;
time = 1:samples;

% % clarke transform (thesis)
% V_A = V_in*cos(w*time);
% V_B = V_in*cos(w*time - 2*pi/3);
% V_C = V_in*cos(w*time + 2*pi/3);

% % AC Voltage result (thesis)
% V_ab1 = V_A * exp(complex(0, 0))...
%  + V_B * exp(complex(0, 2*pi/3))...
%  + V_C * exp(complex(0,-2*pi/3));
% V_ab2 = 3/2 * V_in * exp(complex(0, w * time));

% clarke transform (code)
V_A = V_in * sin(w * time);
V_B = V_in * sin(w * time - 2 * pi / 3);
V_C = V_in * sin(w * time - 4 * pi / 3);

% AC Voltage result (code)
V_ab1 = V_A + V_B * exp(complex(0, 2 * pi / 3)) ...
    + V_C * exp(complex(0, 4 * pi / 3));
V_ab2 = 3/2 * V_in * exp(complex(0, w * time));

% get the maximum value of the vector
V_A_Max = max(V_A);

% % phase angle (ideal)
% thetaP = real(asin(w*time));
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

% getting the sawtooth wave
sawtoothSignal = 0.25 * mod(time - 1, 5);

% creating pwm control signals
switch1 = pulse1 >= sawtoothSignal;
switch2 = ~(pulse1 >= sawtoothSignal);

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

% plot results
% plot them in same figure with subplots 1 column and 6 rows
figure(1);
subplot(6, 1, 1);
plot(S1t);
title('First Switch');
subplot(6, 1, 2);
plot(S2t);
title('Second Switch');
subplot(6, 1, 3);
plot(S3t);
title('Third Switch');
subplot(6, 1, 4);
plot(S4t);
title('Forth Switch');
subplot(6, 1, 5);
plot(S5t);
title('Fifth Switch');
subplot(6, 1, 6);
plot(S6t);
title('Sixth Switch');

% just for VSCode
% pause(30);

% save as image
saveas(figure(1), 'pwm_rewritten.png');

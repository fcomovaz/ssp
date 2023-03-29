% Inverter


m = 1000;
w = (2*pi)/100;
V_in = 170;
i = 1:m;

v_a = V_in*sin(w*i);
v_b = V_in*sin(w*i-2*pi/3);
v_c = V_in*sin(w*i-4*pi/3);

U_in = v_a + v_b*exp(complex(0,2*pi/3))+v_c*exp(complex(0,4*pi/3));

U_in2 = 3/2*V_in*exp(complex(0,w*i-pi/2));

n=m;
Mag_V_in=0;
for i=1:n
    if v_a(i) > Mag_V_in
        Mag_V_in = v_a(i);
    end
    
end

tetaP = zeros(1,m);

for i=1:m
    tetaP(i) =  asin(real(v_a(i))/real(Mag_V_in));
end

% % i = 1:m;
% % plot(i,Alpha_wt,i,tetaP)


tetaP_sum = zeros(1,m);
tetaP_sum (1) = tetaP(1);

for i=2:m 
    Sum = tetaP(i) - tetaP(i-1);
    tetaP_sum (i) = tetaP_sum (i-1) + abs(Sum);
    if tetaP_sum (i) > 2*pi    
        tetaP_sum (i) = 0;
    end
    
end

Do1 = zeros(1,m);
Do2 = zeros(1,m);
Sextant = zeros(1,m);
for i=1:m
    aux = Sext1(tetaP_sum(i));
    Sextant(i)  = aux(1);
    Do1(i)      = aux(2);
    Do2(i)      = aux(3);
end


a=0;
Diente1 = zeros(1,m);
for i=1:m
   Diente1(i)=0.25*a;
   a=a+1;
   if (a>4)
       a = 0;
   end
end


do1ont = zeros(1,m);
do2ont = zeros(1,m);
for i=1:m
do1ont(i)=0; do2ont(i)=1;
    if Do1(i) >= Diente1(i)
        do1ont(i)=1;
        do2ont(i)=0;
    end
end

S1t = zeros(1,m);
S2t = zeros(1,m);
S3t = zeros(1,m);
S4t = zeros(1,m);
S5t = zeros(1,m);
S6t = zeros(1,m);

for i=1:m
    aux = fcn(do1ont(i),do2ont(i),Sextant(i));
    S1t(i) = aux(1);
    S2t(i) = aux(2);
    S3t(i) = aux(3);
    S4t(i) = aux(4);
    S5t(i) = aux(5);
    S6t(i) = aux(6);
end

% figure
% i = 1:m;    
% subplot(3,1,1)
% plot(i,S1t)
% subplot(3,1,2)
% plot(i,S2t)
% subplot(3,1,3)
% plot(i,S3t)

% figure
% subplot(3,1,1)
% plot(i,S4t)
% subplot(3,1,2)
% plot(i,S5t)
% subplot(3,1,3)
% plot(i,S6t)

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

% save as image
saveas(figure(1), 'pwm_original.png');
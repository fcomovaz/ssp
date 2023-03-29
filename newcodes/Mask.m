function aux =  Mask(thetaP)

    % initial values
    pulse1 = 0;
    pulse2 = 0;
    Sextant = 0;

    % angle division
    theta_A1 = thetaP;
    theta_AB = thetaP - 2*pi/3;
    theta_AC = thetaP + 2*pi/3;
    % % this doesn't match the other angles
    % theta_AC = thetaP - 4*pi/3;

    % for 330 360 sextant 1
    if thetaP >= 11*pi/6 && thetaP <= 2*pi
        Sextant = 1;
        pulse1  = -cos(theta_AB) / cos(theta_A1);
        pulse2  = -cos(theta_AC) / cos(theta_A1);
    end

    % for 0 30 sextant 2
    if thetaP < pi/6
        Sextant = 1;
        pulse1  = -cos(theta_AB) / cos(theta_A1);
        pulse2  = -cos(theta_AC) / cos(theta_A1);
    end

    % for 30 90 sextant 2
    if thetaP >= pi/6 && thetaP < pi/2
        Sextant = 2;
        pulse1  = -cos(theta_A1) / cos(theta_AC);
        pulse2  = -cos(theta_AB) / cos(theta_AC);
    end

    % for 90 150 sextant 3
    if thetaP >= pi/2 && thetaP < 5*pi/6
        Sextant = 3;
        pulse1  = -cos(theta_AC) / cos(theta_AB);
        pulse2  = -cos(theta_A1) / cos(theta_AB);
    end

    % for 150 210 sextant 4
    if thetaP >= 5*pi/6 && thetaP < 7*pi/6
        Sextant = 4;
        pulse1  = -cos(theta_AB) / cos(theta_A1);
        pulse2  = -cos(theta_AC) / cos(theta_A1);
    end

    % for 210 270 sextant 5
    if thetaP >= 7*pi/6 && thetaP < 3*pi/2
        Sextant = 5;
        pulse1  = -cos(theta_A1) / cos(theta_AC);
        pulse2  = -cos(theta_AB) / cos(theta_AC);
    end

    % for 270 330 sextant 6
    if thetaP >= 3*pi/2 && thetaP < 11*pi/6
        Sextant = 6;
        pulse1  = -cos(theta_AC) / cos(theta_AB);
        pulse2  = -cos(theta_A1) / cos(theta_AB);
    end

    aux = [Sextant, pulse1, pulse2];
    
end
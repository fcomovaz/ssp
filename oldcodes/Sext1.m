% Determinar sextante, do1, do2

function aux = Sext1(tetaP)

    sex = 0;
    do1 = 0;
    do2 = 0;
    tetaa1 = tetaP; %+pi/2;
    tetab = tetaa1 - 2 * pi / 3;
    tetac = tetaa1 + 2 * pi / 3;

    if tetaP >= 11 * pi / 6 && tetaP <= 2 * pi % Sextante 1 330 to 360

        sex = 1;
        do1 =- cos(tetab) / cos(tetaa1);
        do2 =- cos(tetac) / cos(tetaa1);
    end

    if tetaP < pi / 6 % Sextante 1 0 to 30

        sex = 1;
        do1 =- cos(tetab) / cos(tetaa1);
        do2 =- cos(tetac) / cos(tetaa1);
    end

    if tetaP >= pi / 6 && tetaP < pi / 2 % Sextante 2
        sex = 2;
        do1 =- cos(tetaa1) / cos(tetac);
        do2 =- cos(tetab) / cos(tetac);
    end

    if tetaP >= pi / 2 && tetaP < 5 * pi / 6 % Sextante 3
        sex = 3;
        do1 =- cos(tetac) / cos(tetab);
        do2 =- cos(tetaa1) / cos(tetab);

    end

    if tetaP >= 5 * pi / 6 && tetaP < 7 * pi / 6 % Sextante 4
        sex = 4;
        do1 =- cos(tetab) / cos(tetaa1);
        do2 =- cos(tetac) / cos(tetaa1);

    end

    if tetaP >= 7 * pi / 6 && tetaP < 3 * pi / 2 % Sextante 5
        sex = 5;
        do1 =- cos(tetaa1) / cos(tetac);
        do2 =- cos(tetab) / cos(tetac);
    end

    if tetaP >= 3 * pi / 2 && tetaP < 11 * pi / 6 % Sextante 6
        sex = 6;
        do1 =- cos(tetac) / cos(tetab);
        do2 =- cos(tetaa1) / cos(tetab);
    end

    aux = [sex, do1, do2];

end

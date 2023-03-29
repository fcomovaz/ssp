% Asignaci[on de las mascaras
% Copiado del codigo de Sergio
% 22 de mayo de 2017

function aux = fcn(do1ont, do2ont, sex)
    %#codegen

    % Funcion para asignar la mascara de los disparos
    % en cada uno de los sextantes

    S1t = 0; 
    S2t = 0; 
    S3t = 0;
    S4t = 0; 
    S5t = 1; 
    S6t = 0;

    % 1st sextant
    if do1ont == 1 && sex == 1
        S1t = 1; 
        S2t = 0; 
        S3t = 0;
        S4t = 0; 
        S5t = 1; 
        S6t = 0;
    end

    if do2ont == 1 && sex == 1
        S1t = 1; 
        S2t = 0; 
        S3t = 0;
        S4t = 0; 
        S5t = 0; 
        S6t = 1;
    end

    % 2nd sextant
    if do1ont == 1 && sex == 2
        S1t = 1; 
        S2t = 0; 
        S3t = 0;
        S4t = 0; 
        S5t = 0; 
        S6t = 1;
    end

    if do2ont == 1 && sex == 2
        S1t = 0; 
        S2t = 1; 
        S3t = 0;
        S4t = 0; 
        S5t = 0; 
        S6t = 1;
    end

    % 3rd sextant
    if do1ont == 1 && sex == 3
        S1t = 0; 
        S2t = 1; 
        S3t = 0;
        S4t = 0; 
        S5t = 0; 
        S6t = 1;
    end

    if do2ont == 1 && sex == 3
        S1t = 0; 
        S2t = 1; 
        S3t = 0;
        S4t = 1; 
        S5t = 0; 
        S6t = 0;
    end

    % 4th sextant
    if do1ont == 1 && sex == 4
        S1t = 0; 
        S2t = 1; 
        S3t = 0;
        S4t = 1; 
        S5t = 0; 
        S6t = 0;
    end

    if do2ont == 1 && sex == 4
        S1t = 0; 
        S2t = 0; 
        S3t = 1;
        S4t = 1; 
        S5t = 0; 
        S6t = 0;
    end

    % 5th sextant
    if do1ont == 1 && sex == 5
        S1t = 0; 
        S2t = 0; 
        S3t = 1;
        S4t = 1; 
        S5t = 0; 
        S6t = 0;
    end

    if do2ont == 1 && sex == 5
        S1t = 0; 
        S2t = 0; 
        S3t = 1;
        S4t = 0; 
        S5t = 1; 
        S6t = 0;
    end

    % 6th sextant
    if do1ont == 1 && sex == 6
        S1t = 0; 
        S2t = 0; 
        S3t = 1;
        S4t = 0; 
        S5t = 1; 
        S6t = 0;
    end

    if do2ont == 1 && sex == 6
        S1t = 1; 
        S2t = 0; 
        S3t = 0;
        S4t = 0; 
        S5t = 1; 
        S6t = 0;
    end

    aux = [S1t, S2t, S3t, S4t, S5t, S6t];
end

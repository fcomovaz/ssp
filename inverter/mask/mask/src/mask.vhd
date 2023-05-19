LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE ieee.math_real.ALL;

--! Este modulo permita la asignación del sextante donde se encuentra la señal de acuerdo a las razones entre los ángulos de la señal.

ENTITY mask IS
    PORT (
        angle : IN real;--! Ángulo de la señal.
        sextant : OUT INTEGER;--! Sextante donde se encuentra la señal.
        pulse1 : OUT real;--! Pulso de la señal para switch1.
        pulse2 : OUT real--! Pulso de la señal para switch2.
    );
END ENTITY mask;

ARCHITECTURE assign_sextant OF mask IS
    SIGNAL theta_A1 : real := angle;--! Ángulo Original.
    SIGNAL theta_AB : real := angle - 2.0 * MATH_PI/3.0;--! Ángulo de la señal con respecto a la base.
    SIGNAL theta_AC : real := angle + 2.0 * MATH_PI/3.0;--! Ángulo de la señal con respecto a la base.
BEGIN

    -- make if statements to assign the sextant and pulses
    assignement : PROCESS (angle)
    BEGIN
        -- for 330 to 360 degrees
        IF (angle >= 11.0 * MATH_PI/6.0 AND angle <= 2.0 * MATH_PI) THEN
            sextant <= 1;
            pulse1 <= - 1.0 * cos(theta_AB) / cos(theta_A1);
            pulse2 <= - 1.0 * cos(theta_AC) / cos(theta_A1);
        END IF;
        -- for 0 to 30 degrees
        IF (angle >= 0.0 AND angle <= MATH_PI/6.0) THEN
            sextant <= 1;
            pulse1 <= - 1.0 * cos(theta_AB) / cos(theta_A1);
            pulse2 <= - 1.0 * cos(theta_AC) / cos(theta_A1);
        END IF;
        -- for 30 to 90 degrees
        IF (angle >= MATH_PI/6.0 AND angle <= MATH_PI/2.0) THEN
            sextant <= 2;
            pulse1 <= - 1.0 * cos(theta_A1) / cos(theta_AC);
            pulse2 <= - 1.0 * cos(theta_AB) / cos(theta_AC);
        END IF;
        -- for 90 to 150 degrees
        IF (angle >= MATH_PI/2.0 AND angle <= 5.0 * MATH_PI/6.0) THEN
            sextant <= 3;
            pulse1 <= - 1.0 * cos(theta_AC) / cos(theta_AB);
            pulse2 <= - 1.0 * cos(theta_A1) / cos(theta_AB);
        END IF;
        -- for 150 to 210 degrees
        IF (angle >= 5.0 * MATH_PI/6.0 AND angle <= 7.0 * MATH_PI/6.0) THEN
            sextant <= 4;
            pulse1 <= - 1.0 * cos(theta_AB) / cos(theta_A1);
            pulse2 <= - 1.0 * cos(theta_AC) / cos(theta_A1);
        END IF;
        -- for 210 to 270 degrees
        IF (angle >= 7.0 * MATH_PI/6.0 AND angle <= 3.0 * MATH_PI/2.0) THEN
            sextant <= 5;
            pulse1 <= - 1.0 * cos(theta_A1) / cos(theta_AC);
            pulse2 <= - 1.0 * cos(theta_AB) / cos(theta_AC);
        END IF;
        -- for 270 to 330 degrees
        IF (angle >= 3.0 * MATH_PI/2.0 AND angle <= 11.0 * MATH_PI/6.0) THEN
            sextant <= 6;
            pulse1 <= - 1.0 * cos(theta_AC) / cos(theta_AB);
            pulse2 <= - 1.0 * cos(theta_A1) / cos(theta_AB);
        END IF;
    END PROCESS assignement;

END ARCHITECTURE assign_sextant;
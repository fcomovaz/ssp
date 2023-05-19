LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE ieee.math_real.ALL;

--! Este modulo permita la asignación del sextante donde se encuentra la señal de acuerdo a las razones entre los ángulos de la señal.

ENTITY mask_tb IS
END ENTITY mask_tb;

ARCHITECTURE assign_sextant OF mask_tb IS
    -- add component declaration here
    COMPONENT mask IS
        PORT (
            angle : IN real;--! Ángulo de la señal.
            sextant : OUT INTEGER;--! Sextante donde se encuentra la señal.
            pulse1 : OUT real;--! Pulso de la señal para switch1.
            pulse2 : OUT real--! Pulso de la señal para switch2.
        );
    END COMPONENT;

    -- input signal of the angle
    SIGNAL angle : REAL := 0.0;
    -- output signals
    SIGNAL sextant : INTEGER := 0;
    SIGNAL pulse1 : REAL := 0.0;
    SIGNAL pulse2 : REAL := 0.0;

BEGIN
    -- port map component
    uut : mask PORT MAP(
        angle => angle,
        sextant => sextant,
        pulse1 => pulse1,
        pulse2 => pulse2
    );

    -- stimulus
    stim_proc : PROCESS
    BEGIN
        -- 0 degrees is 1st sextant
        angle <= 0.0;
        WAIT FOR 10 ns;
        -- 110 degrees is 2nd sextant
        angle <= 80.0 * MATH_DEG_TO_RAD;
        WAIT FOR 10 ns;
        -- 120 degrees is 3rd sextant
        angle <= 120.0 * MATH_DEG_TO_RAD;
        WAIT FOR 10 ns;
        -- 200 degrees is 4th sextant
        angle <= 200.0 * MATH_DEG_TO_RAD;
        WAIT FOR 10 ns;
        -- 250 degrees is 5th sextant
        angle <= 250.0 * MATH_DEG_TO_RAD;
        WAIT FOR 10 ns;
        -- 300 degrees is 6th sextant
        angle <= 300.0 * MATH_DEG_TO_RAD;
        WAIT FOR 10 ns;
        WAIT;
    END PROCESS;
END ARCHITECTURE assign_sextant;
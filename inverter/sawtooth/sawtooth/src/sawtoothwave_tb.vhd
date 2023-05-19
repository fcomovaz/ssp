LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE ieee.math_real.ALL;

ENTITY sawToothWave_tb IS
END ENTITY sawToothWave_tb;

ARCHITECTURE generation OF sawToothWave_tb IS
    COMPONENT sawToothWave
        PORT (
            counter : IN INTEGER;--! contador de en que momento del tiempo estamos
            sawtooth : OUT real --! Señal de diente de sierra
        );
    END COMPONENT sawToothWave;

    SIGNAL sawtooth : real := 0.0;
    SIGNAL counter : INTEGER := 0;
BEGIN

    uut : sawToothWave PORT MAP(
        counter => counter,
        sawtooth => sawtooth
    );

    stimulus : PROCESS
    BEGIN
        FOR i IN 0 TO 18 LOOP
            counter <= i;
            WAIT FOR 3 ns;
        END LOOP;
        WAIT;
    END PROCESS stimulus;

END ARCHITECTURE generation;
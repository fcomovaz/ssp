LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE ieee.math_real.ALL;

ENTITY sawToothWave IS
    PORT (
        counter : IN INTEGER;--! contador de en que momento del tiempo estamos
        sawtooth : OUT real --! Señal de diente de sierra
    );
END ENTITY sawToothWave;

ARCHITECTURE generation OF sawToothWave IS
BEGIN
    generate_on_change : PROCESS (counter)
    BEGIN
        sawtooth <= 0.25 * ((real(counter) - 1.0) MOD 5.0);
    END PROCESS;
END ARCHITECTURE generation;
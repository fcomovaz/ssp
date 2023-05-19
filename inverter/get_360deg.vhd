LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE ieee.math_real.ALL;

ENTITY get_360deg IS
  PORT (
    clk : IN STD_LOGIC;
    reset : IN STD_LOGIC;
    angle : OUT real
  );
END ENTITY get_360deg;

ARCHITECTURE full_circle OF get_360deg IS
  SIGNAL index : INTEGER RANGE 0 TO 360;

BEGIN

  PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      index <= 0;
    ELSIF rising_edge(clk) THEN
      IF index = 360 THEN
        index <= 0;
      ELSE
        index <= index + 1;
      END IF;
    END IF;
    -- convert to radians
    angle <= real(index) * MATH_DEG_TO_RAD;
  END PROCESS;

END ARCHITECTURE full_circle;
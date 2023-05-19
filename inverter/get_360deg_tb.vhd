library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

entity get_360deg_tb is
end entity get_360deg_tb;

architecture full_circle of get_360deg_tb is
  component get_360deg is
    port (
      clk : in std_logic;
      reset : in std_logic;
      angle : out real
    );
  end component get_360deg;

  --   signals for port map
  signal clk : std_logic := '0';
  signal reset : std_logic := '0';
  signal angle : real := 0.0;

begin

  -- create component
  uut : get_360deg port map(
    clk => clk,
    reset => reset,
    angle => angle
  );

  -- clock process
  stimulus : process
  begin
    for i in 1 to 40 loop
      clk <= '1';
      wait for 1 ns;
      clk <= '0';
      wait for 1 ns;
    end loop;
    wait;
  end process;
end architecture full_circle;
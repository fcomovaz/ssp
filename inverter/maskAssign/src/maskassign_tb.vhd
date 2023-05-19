library ieee;
use ieee.std_logic_1164.all;

--! Este programa produce la activación de los interruptores (máscara). En este caso haremos un testbench para el código.

entity maskAssign_tb is
end entity;

architecture testbench of maskAssign_tb is
  component maskAssign
    port (
      switch1, switch2 : in std_logic;--! Es nuestra señal que nos indicará que interruptor activar.
      sextant : in integer;--! Es el sextante que se activará.
      mask : out std_logic_vector(5 downto 0)--! Es la máscara que se activará.
    );
  end component maskAssign;

  --   signals for the port map
  signal switch1, switch2 : std_logic := '0';
  signal sextant : integer := 0;
  signal mask : std_logic_vector(5 downto 0) := (others => '0');
begin
  -- create component instance
  uut : maskAssign port map(
    switch1 => switch1,
    switch2 => switch2,
    sextant => sextant,
    mask => mask
  );
  -- stimulus process
  stimulus : process
  begin
    -- make sextant 1
    sextant <= 1;
    switch1 <= '1';
    switch2 <= '0';
    wait for 10 ns;
    -- make sextant 2
    sextant <= 2;
    switch1 <= '0';
    switch2 <= '1';
    wait for 10 ns;
    -- make sextant 3
    sextant <= 3;
    switch1 <= '1';
    switch2 <= '1';
    wait for 10 ns;
    -- end simulation
    wait;
  end process;

end architecture testbench;
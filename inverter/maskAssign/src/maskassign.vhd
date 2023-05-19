library ieee;
use ieee.std_logic_1164.all;

--! Este programa produce la activación de los interruptores (máscara).

entity maskAssign is
  port (
    switch1, switch2 : in std_logic;--! Es nuestra señal que nos indicará que interruptor activar.
    sextant : in integer;--! Es el sextante que se activará.
    mask : out std_logic_vector(5 downto 0)--! Es la máscara que se activará.
  );
end entity;

architecture conditions of maskAssign is

begin
  check_sextant_to_assign : process (switch1, switch2, sextant)
  begin
    case (sextant) is
        -- primer sextante
      when 1 =>
        if switch1 = '1' then
          mask <= "100010";
        end if;
        if switch2 = '1' then
          mask <= "100001";
        end if;

        -- segundo sextante
      when 2 =>
        if switch1 = '1' then
          mask <= "100001";
        end if;
        if switch2 = '1' then
          mask <= "010001";
        end if;

        -- tercer sextante
      when 3 =>
        if switch1 = '1' then
          mask <= "010001";
        end if;
        if switch2 = '1' then
          mask <= "010100";
        end if;

        -- cuarto sextante
      when 4 =>
        if switch1 = '1' then
          mask <= "010100";
        end if;
        if switch2 = '1' then
          mask <= "001100";
        end if;

        -- quinto sextante
      when 5 =>
        if switch1 = '1' then
          mask <= "001100";
        end if;
        if switch2 = '1' then
          mask <= "001010";
        end if;

        -- sexto sextante
      when 6 =>
        if switch1 = '1' then
          mask <= "001010";
        end if;
        if switch2 = '1' then
          mask <= "100010";
        end if;

        --   para cualquier otro caso
        -- se desactivan todos los interruptores
      when others =>
        mask <= "000000";
    end case;
  end process check_sextant_to_assign;

end architecture;
--
-- Multiplexor is a device to select different
-- inputs to outputs. we use 3 bits vector to
-- describe its I/O ports
-----------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-----------------------------------------------

entity Mux_VHDL is
port (  I3:     in std_logic_vector(2 downto 0);
        I2:     in std_logic_vector(2 downto 0);
        I1:     in std_logic_vector(2 downto 0);
        I0:     in std_logic_vector(2 downto 0);
        S:      in std_logic_vector(1 downto 0);
        O:      out std_logic_vector(2 downto 0)
);
end Mux_VHDL;

-----------------------------------------------

architecture behv1 of Mux_VHDL is
begin
    process(I3,I2,I1,I0,S)
    begin
        -- use case statement
        case S is
            when "00" =>        O <= I0;
            when "01" =>        O <= I1;
            when "10" =>        O <= I2;
            when "11" =>        O <= I3;
            when others =>        O <= "ZZZ";
        end case;
    end process;
end behv1;

architecture behv2 of Mux_VHDL is
begin
    -- use when.. else statement
    O <=        I0 when S="00" else
                I1 when S="01" else
                I2 when S="10" else
                I3 when S="11" else
                "ZZZ";
end behv2;

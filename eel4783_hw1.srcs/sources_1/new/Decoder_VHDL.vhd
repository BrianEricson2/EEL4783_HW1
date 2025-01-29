----------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;

----------------------------------------------------------------------------------

entity Decoder_VHDL is
port (
        I:     in std_logic_vector(1 downto 0);
        O:     out std_logic_vector(3 downto 0)
);
end Decoder_VHDL;

----------------------------------------------------------------------------------

architecture behv1 of Decoder_VHDL is
begin
process(I) begin
    case I is
        when "00" =>        O <= "0001";
        when "01" =>        O <= "0010";
        when "10" =>        O <= "0100";
        when "11" =>        O <= "1000";
        when others =>      O <= "0000";
    end case;
end process;
end behv1;

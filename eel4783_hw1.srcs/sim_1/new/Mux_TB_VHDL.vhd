-----------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_arith.all;

entity Mux_TB_VHDL is            -- empty entity
end Mux_TB_VHDL;

-----------------------------------------------

architecture TB of Mux_TB_VHDL is
    -- initialize the declared signals
    signal T_I3: std_logic_vector(2 downto 0):="000";
    signal T_I2: std_logic_vector(2 downto 0):="000";
    signal T_I1: std_logic_vector(2 downto 0):="000";
    signal T_I0: std_logic_vector(2 downto 0):="000";
    signal T_O: std_logic_vector(2 downto 0);
    signal T_S: std_logic_vector(1 downto 0);
    
    component Mux_VHDL
    port(       I3:     in std_logic_vector(2 downto 0);
                I2:     in std_logic_vector(2 downto 0);
                I1:     in std_logic_vector(2 downto 0);
                I0:     in std_logic_vector(2 downto 0);
                S:      in std_logic_vector(1 downto 0);
                O:      out std_logic_vector(2 downto 0)
    );
    end component;
    
begin
    U_Mux: Mux_VHDL port map (T_I3, T_I2, T_I1, T_I0, T_S, T_O);
    process
        variable err_cnt: integer :=0;
    begin
        T_I3 <= "001";
        T_I2 <= "010";
        T_I1 <= "101";
        T_I0 <= "111";
        
        -- case select equal "00"
        wait for 10 ns;
        T_S <= "00";
        wait for 1 ns;
        assert (T_O="111") report "Error Case 0" severity error;
        if(T_O/="111") then
            err_cnt := err_cnt+1;
        end if;
        
        -- case select equal "01"
        wait for 10 ns;
        T_S <= "01";
        wait for 1 ns;
        assert (T_O="101") report "Error Case 1" severity error;
        if(T_O/="101") then
            err_cnt := err_cnt+1;
        end if;
        
        -- case select equal "10"
        wait for 10 ns;
        T_S <= "10";
        wait for 1 ns;
        assert (T_O="010") report "Error Case 2" severity error;
        if(T_O/="010") then
            err_cnt := err_cnt+1;
        end if;
        
        -- case select equal "11"
        wait for 10 ns;
        T_S <= "11";
        wait for 1 ns;
        assert (T_O="001") report "Error Case 3" severity error;
        if(T_O/="001") then
            err_cnt := err_cnt+1;
        end if;
        
        -- case equal "11"
        wait for 10 ns;
        T_S <= "UU";
        
        -- summary of all the tests
        if (err_cnt=0) then
            assert (false)
            report "Testbench of Mux completed successfully!"
            severity note;
        else
            assert (true)
            report "Something wrong, try again!"
            severity error;
        end if;
        
        wait;
    end process;
end TB;

-----------------------------------------------
configuration CFG_TB of Mux_TB_VHDL is
        for TB
        end for;
end CFG_TB;
-----------------------------------------------
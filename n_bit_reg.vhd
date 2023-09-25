library IEEE;
use IEEE.std_logic_1164.all;

entity reg_A is
    port(
        clk : in std_logic;
        reset : in std_logic;
        load : in std_logic;
        data_in : in std_logic_vector(11 to 0);
        data_out : out std_logic_vector(11 to 0));
end entity reg_A;

architecture Behavioral of reg_A is
    -- type reg is array (11 to 0) of std_logic_vector(11 to 0);
    signal reg: std_logic_vector(11 to 0);
    begin 
        process(clk) is 
        begin
            if rising_edge(clk) then
                if reset = '1' then
                    reg <= '000000000000'; 
                elsif load = '1'then
                    reg <= data_in;
                end if;
            end if;
        end process;
        data_out<=reg;
    end Behavioral;

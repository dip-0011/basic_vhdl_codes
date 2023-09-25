library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
--use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity square_root is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           start : in STD_LOGIC;
           dataIn : in integer;
           dataOut : out integer);
end square_root;

architecture Behavioral of square_root is
    signal guess: integer;
    signal nxt_guess: integer;
    signal count : integer := 0;
    signal diff : integer;
    signal temp : integer;
    constant MAX_ITR : integer := 16;
    
begin
 process(clk,reset) 
    begin
        if (reset = '1') then
            guess <= 0;
            count <= 0;
        elsif (rising_edge(clk)) then
            if (start = '1' and count<MAX_ITR) then
                temp <= dataIn/guess;
                nxt_guess <= (temp+guess)/2;
                diff <= (nxt_guess-guess);
                if (count = 0) then
                    guess <= dataIn/2;
                end if ;
                if (diff = 0) then
                    dataOut <= nxt_guess;
                else
                     guess <= nxt_guess;
                     count <= count+1;
                end if ;
            end if ;
        end if;
    end process;


end Behavioral;

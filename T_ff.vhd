library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity t_ff is
    port(
        T:in std_logic;
        clk: in std_logic;
        Q: out std_logic;
        Q_bar: out std_logic
    );
end entity t_ff;

architecture dataflow of t_ff is
    signal A1,A2: std_logic;
    signal Q1,Q1_bar:std_logic;
    begin
        A1<=(T and clk and Q1);
        A2<=(T and clk and Q1_bar);

        Q1 <= (A1 nor Q1_bar);
        Q1_bar <= (A2 nor Q1);
        
        Q<=Q1;
        Q_bar<=Q1_bar;
              
end architecture dataflow ;
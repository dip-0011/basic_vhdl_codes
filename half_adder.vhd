library ieee;
use ieee.std_logic_1164.all;

entity half_adder is
    port(a,b: in std_logic;
    sum,c_out: out std_logic);
end entity;

architecture dataflow of half_adder is
    begin
        sum <= a xor b ; --xor gate to get the carry bit
        c_out<= a and b;
end dataflow;
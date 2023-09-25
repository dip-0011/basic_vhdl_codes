library IEEE;
use IEEE.std_logic_1164.all;

entity full_adder is
    port(IN1,IN2,C_in:in std_logic;
    sum,C_out:out std_logic);
end entity full_adder;

architecture dataflow of full_adder is
    signal s1,s2,s3 : std_logic;
    constant delay:time:=5ns;
    begin
    HA1: process(IN1,IN2) is 
    begin
        s1<=(IN1 xor IN2) after delay;
        s3<=(IN1 and IN2) after delay;
    end process HA1;

    HA2: process(s1, C_in) is
    begin
        sum<=(s1 xor C_in) after delay;
        s2<=(s1 and C_in) after delay;
    end process HA2;

    OR1: process(s3,s2) is
    begin
        C_out<=(s3 or s2) after delay;
    end process OR1;

    end architecture dataflow ;


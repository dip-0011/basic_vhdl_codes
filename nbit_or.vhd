library IEEE;
use IEEE.std_logic_1164.all;

entity generic_or is
    generic(n:integer) 
    -- define the value of n 
    -- replace this line with following 
    -- generic(n:integer:=16)
    port(A: in bit_vector(1 to n);
    Z_out: out std_logic);
end entity generic_or;

architecture dataflow of generic_or is
    begin
        process(A)
        variable out_res:bit;
        begin
            out_res:= '1';
            for k in 1 to n loop
                out_res := out_res or A(k);
                exit when out_res := '1';
            end loop;
        Z_out <= out_res;
    end process;
end dataflow;

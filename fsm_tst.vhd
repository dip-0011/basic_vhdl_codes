library IEEE;
use IEEE.std_logic_1164.all;

entity fsm_tst is
    port(
    clk : in std_logic;
    reset : in std_logic;    
    X1,X2: in std_logic;
    Z1,Z2: out std_logic);
end entity fsm_tst;

architecture behavioural of fsm_tst is
    type state is (A,B,C);
    signal currentState, nextState: state;
    signal Y2,Y1 : std_logic;
    begin
    process (clk,reset) 
    begin
        if (reset = '1') then 
            currentState <= A;
        elsif rising_edge(clk) then
            currentState <= nextState;
        end if;
    end process; 
    process (currentState,X1,X2)
    begin
        case currentState is
            when A =>
                    Z2<='1';
                    Y1<='1';
                    Y2<='1';
                if (X1='0') then
                    Z1<='0';
                    nextState <= A;
                elsif (X1='1') then
                    Z1<='1';
                    nextState <= B;
            end if;
            when B =>
                    Z2<='0';
                    Y1<='1';
                    Y2<='0';
                if (X2='0') then
                    Z1<='1';
                    nextState <= C;
                elsif (X2='1') then
                    Z1<='0';
                    nextState <= A;
                end if ;
            when C => 
                    Z2<='1';
                    Y1<='0';
                    Y2<='0';
                if (X2='0') then
                    Z1<='0';
                    nextState <= A;
                elsif (X2='1') then
                    Z1<='1';
                    nextState <= C;
                end if ;
        end case;
    end process;
end behavioural;
        

                


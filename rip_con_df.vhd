library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity ripp_counter is
    port(
        u_db: in std_logic;
        clk   : in  std_logic;
        Z0,Z1,Z2,Z3: out std_logic
    );
end entity ripp_counter;

architecture dataflow of ripp_counter is
    signal TT1,TT2,TT3:std_logic;
    signal A1,B1,A2,B2,A3,B3: std_logic;
    signal Q0,Q1,Q2,Q3:std_logic;
    signal Q0_bar,Q1_bar,Q2_bar,Q3_bar:std_logic;
    signal uno : std_logic := '1';
    
    signal u,db: std_logic;
    component t_ff 
        port(T,clk: in std_logic;
        Q,Q_bar : out std_logic);
    end component;
    begin
        T0: t_ff port map(uno,clk,Q0,Q0_bar);
        T1: t_ff port map(uno,TT1,Q1,Q1_bar);
        T2: t_ff port map(uno,TT2,Q2,Q2_bar);
        T3: t_ff port map(uno,TT3,Q1,Q3_bar);

        u<= u_db;
        db<=(not u_db);

        A1 <= (Q0 and u);
        B1 <= (Q0_bar and db);
        TT1 <= (A1 or B1);
        A2 <= (Q1 and u);
        B2 <= (Q1_bar and db);
        TT2 <= (A2 or B2);
        A3 <= (Q2 and u);
        B3 <= (Q2_bar and db);
        TT3 <= (A3 or B3);
        
        Z0 <= Q0;
        Z1 <= Q1;
        Z2 <= Q2;
        Z3 <= Q3;
end dataflow;




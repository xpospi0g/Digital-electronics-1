https://github.com/xpospi0g/Digital-electronics-1

library IEEE;
use IEEE.std_logic_1164.all;
------------------------------------------------------------------------
-- Entity declaration for basic gates
------------------------------------------------------------------------
entity gates is port(
        c_i     : in  std_logic;     
        b_i     : in  std_logic;       
        a_i     : in  std_logic;        
        f_o     : out std_logic;      
        fnand_o : out std_logic;   
        fnor_o  : out std_logic             
    );
end entity gates;
------------------------------------------------------------------------
-- Architecture body for basic gates
------------------------------------------------------------------------
-- Usage of De Morgan laws on function f using nands and nors
architecture dataflow of gates is begin
    f_o  <= ((not b_i) and a_i) or ((not c_i) and (not b_i));
    fnand_o <= not(not((not b_i) and a_i) and not((not c_i) and (not b_i)));
    fnor_o <= not(b_i or (not a_i)) or not(c_i or b_i);
end architecture dataflow;



https://www.edaplayground.com/x/NYbN
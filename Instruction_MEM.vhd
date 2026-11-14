library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Instruction_MEM is 
port ( input_ADDR : in  std_logic_vector(6-1 downto 0);
       inst0      : out std_logic_vector(8-1 downto 0);
	   inst1      : out std_logic_vector(8-1 downto 0);
	   inst2      : out std_logic_vector(8-1 downto 0);
	   inst3      : out std_logic_vector(8-1 downto 0));
end Instruction_MEM;

architecture behavioral of Instruction_MEM is 


type inst_array is array (0 to 63) of std_logic_vector(8-1 downto 0);
signal Instruction : inst_array;


begin

inst0 <= Instruction(to_integer(unsigned(input_ADDR)));
inst1 <= Instruction(to_integer(unsigned(input_ADDR))+1);
inst2 <= Instruction(to_integer(unsigned(input_ADDR))+2);
inst3 <= Instruction(to_integer(unsigned(input_ADDR))+3);


end behavioral;
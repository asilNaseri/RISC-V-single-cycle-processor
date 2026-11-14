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
signal Instruction : inst_array := 
                           ("00000000","01010000","00000000","10010011", -- addi x1,x0,5
                            "00000000","10100000","00000001","00010011", -- addi x2,x0,10
                            "00000000","01110000","00000001","10010011", -- addi x3,x0,7
                            "00000000","00100000","10000010","00110011", -- add x4,x1,x2
                            "00000000","00110010","00000010","10110011", -- add x5,x4,x3
                           
                            "00000000","11000000","00000000","10010011", -- addi x1,x0,12
                            "00000000","10100000","00000001","00010011", -- addi x2,x0,10
                            "00000000","00100000","11110001","10110011", -- and x3,x1,x2
                            "00000000","00100000","11100010","00110011", -- or x4,x1,x2
                           
                            "00000001","01000000","00000000","10010011", -- addi x1,x0,20
                            "11111111","10110000","10000001","00010011", -- addi x2,x1,-5
                            "00000000","11110000","11110001","10010011", -- andi x3,x1,0x0F
                            "00000000","00010001","01100010","00110011", -- ori x4,x2,0x01
                           
                            "11111111","10110000","10000001","00010011", -- dontcare
                            "00000000","11110000","11110001","10010011", -- dontcare
                            "00000000","00010001","01100010","00110011" );


begin

inst0 <= Instruction(to_integer(unsigned(input_ADDR)));
inst1 <= Instruction(to_integer(unsigned(input_ADDR))+1);
inst2 <= Instruction(to_integer(unsigned(input_ADDR))+2);
inst3 <= Instruction(to_integer(unsigned(input_ADDR))+3);


end behavioral;
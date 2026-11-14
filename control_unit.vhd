library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity control_unit is
port( instruction : in std_logic_vector(32-1 downto 0);
      RegWEn      : out std_logic;
      ImmSel      : out std_logic;
      BSel        : out std_logic;
      ALUSel      : out std_logic_vector(2-1 downto 0));
end control_unit;


architecture behavioral of control_unit is

signal opcode : std_logic_vector(7-1 downto 0);
signal func7  : std_logic_vector(7-1 downto 0);
signal func3  : std_logic_vector(3-1 downto 0);

begin

opcode <= instruction(6 downto 0);
func3  <= instruction(14 downto 12);
func7  <= instruction(31 downto 25);

with instruction(7-1 downto 0) select
BSel <= '1' when "0010011",
        '0' when others;
		
with instruction(7-1 downto 0) select
ImmSel <= '1' when "0010011",
          '0'   when others;

ALUSel <= 
    "00" when (opcode = "0110011") and (func7 & func3 = "0000000000") else
    "01" when (opcode = "0110011") and (func7 & func3 = "0100000000") else
    "10" when (opcode = "0110011") and (func7 & func3 = "0000000111") else
    "11" when (opcode = "0110011") and (func7 & func3 = "0000000110") else
    "00" when (opcode = "0010011") and (func3 = "000") else
    "10" when (opcode = "0010011") and (func3 = "111") else
    "11";

RegWEn <= '1';

end behavioral; 	  
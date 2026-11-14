library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity RegisterFile is 
port( clk    : in  std_logic;
      Addr_A : in  std_logic_vector(5-1 downto 0);
	  Addr_B : in  std_logic_vector(5-1 downto 0);
	  Addr_D : in  std_logic_vector(5-1 downto 0);
	  Data_D : in  std_logic_vector(32-1 downto 0);
	  RegWEn : in  std_logic;
	  Data_A : out std_logic_vector(32-1 downto 0);
	  Data_B : out std_logic_vector(32-1 downto 0));
end RegisterFile;

architecture behavioral of RegisterFile is 


type reg_array is array (0 to 32-1) of std_logic_vector(32-1 downto 0);
signal reg : reg_array := (others => (others => '0'));

signal data_out_A : std_logic_vector(32-1 downto 0);
signal data_out_B : std_logic_vector(32-1 downto 0);

begin 

process(clk) 
begin

if rising_edge(clk) then
   
   
   if RegWEn = '1' then 
      reg(to_integer(unsigned(Addr_D))) <= Data_D;
   end if;
   

end if;
end process;

   Data_A <= reg(to_integer(unsigned(Addr_A)));  
   Data_B <= reg(to_integer(unsigned(Addr_B)));

end behavioral;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity PC is 
port( clk          : in  std_logic;
      current_inst : out  std_logic_vector(6-1 downto 0) := (others => '0'));
end entity;

architecture behavioral of PC is 

begin

process(clk)
begin
if rising_edge(clk) then 
current_inst <= std_logic_vector(unsigned(current_inst) + 4);
end if;
end process;

end behavioral;
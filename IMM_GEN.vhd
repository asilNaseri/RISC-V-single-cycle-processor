library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity IMM_GEN is
port( input : in signed(12-1 downto 0);
      output : out signed(32-1 downto 0)
    );
end IMM_GEN;

architecture behavioral of IMM_GEN is

begin

output <= resize(input,32);

end behavioral;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ALU is 
port( Data_A : in std_logic_vector(32-1 downto 0);
      Data_B : in std_logic_vector(32-1 downto 0);
	  ALUSel : in std_logic_vector(2-1 downto 0);
	  Data_D : out std_logic_vector(32-1 downto 0)
    );
end  ALU;

architecture behavioral of ALU is

signal A : signed(Data_A'range);
signal B : signed(Data_B'range);
signal D : signed(Data_B'range);


begin 
A<=signed(Data_A);
B<=signed(Data_B);
Data_D<=STD_LOGIC_VECTOR(D);

with ALUSel select
D <= 
          A + B when "00",
          A - B when "01",
		  A and B when "10",
		  A or B when others;
		  
end behavioral;
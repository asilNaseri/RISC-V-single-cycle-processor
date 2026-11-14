----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/15/2025 10:09:11 AM
-- Design Name: 
-- Module Name: DMEM - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity DMEM is
    Port ( DATAR :  out signed (31 downto 0);
           DATAW :  in signed (31 downto 0);
           ADDR :   in STD_LOGIC_VECTOR (31 downto 0);
           MemWEn : in STD_LOGIC;
           clk :    in STD_LOGIC);
end DMEM;

architecture Behavioral of DMEM is
type MEM_Array is array (0 to 4*8-1) of STD_LOGIC_VECTOR(7 downto 0);
signal MEM : MEM_Array := (others => (others => '0'));
signal DataR_stdv : STD_LOGIC_VECTOR(DataR'range);
signal addr_trimmed : unsigned (4 downto 0);
--signal byteoffset : integer range 0 to 3;
begin

addr_trimmed<=unsigned(Addr(4 downto 0));
--byteoffset<=to_integer(unsigned(Addr(1 downto 0)));
DataR <= signed(DataR_stdv);
DataR_stdv<=   (MEM(to_integer(addr_trimmed))&
                MEM(to_integer(addr_trimmed+1))&
                MEM(to_integer(addr_trimmed+2))&
                MEM(to_integer(addr_trimmed+3)));

process(clk)
begin
if rising_edge (clk) then
    if (MemWEn='1')then
    MEM(to_integer(addr_trimmed))  <=STD_LOGIC_VECTOR(DataW(31 downto 24));
    MEM(to_integer(addr_trimmed+1))<=STD_LOGIC_VECTOR(DataW(23 downto 16));
    MEM(to_integer(addr_trimmed+2))<=STD_LOGIC_VECTOR(DataW(15 downto 8));
    MEM(to_integer(addr_trimmed+3))<=STD_LOGIC_VECTOR(DataW(7 downto 0));
    end if;
end if;
end process;
end Behavioral;

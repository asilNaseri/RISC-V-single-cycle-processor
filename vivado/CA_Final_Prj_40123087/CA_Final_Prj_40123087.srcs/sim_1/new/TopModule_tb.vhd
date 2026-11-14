----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/02/2025 03:02:12 PM
-- Design Name: 
-- Module Name: TopModule_tb - Behavioral
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity TopModule_tb is
--  Port ( );
end TopModule_tb;

architecture Behavioral of TopModule_tb is


component TopModule is
port ( clk    : in  std_logic);
end component;


signal CLK : std_logic :='0';
constant clk_period : time := 10ns;


begin

uut : TopModule 
    port map (
        clk  => CLK
    );

process
begin
CLK <= '0'; wait for clk_period/2;
CLK <= '1'; wait for clk_period/2;
end process;

end Behavioral;

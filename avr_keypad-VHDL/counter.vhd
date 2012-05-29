--! @file
--! @author Mariya
----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:23:22 05/02/2012 
-- Design Name: 
-- Module Name:    counter - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
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
use IEEE.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity counter is
    Port ( clk, en_counter, rst_counter : in  STD_LOGIC;
           outp_counter : out  STD_LOGIC_VECTOR (1 downto 0));
end counter;

architecture Behavioral of counter is

signal count: std_logic_vector(1 downto 0):="00";  --initilazing the start value of the counter - test relevant
begin

process(clk,count,rst_counter)

begin

if rst_counter='1' then
	count<="00";
elsif rising_edge(clk) then
	if en_counter='1' then
		if count="11" then
			count<="00";
		else
			count<=count+"01";
		end if;
	end if;
end if;
end process;
outp_counter<=count;  --runs in parallel with the process!

end Behavioral;
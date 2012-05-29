--! @file
--! @author Mariya
----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:01:25 05/07/2012 
-- Design Name: 
-- Module Name:    debouncing - Behavioral 
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

entity debouncing is
    Port ( clock,enable, reset : in  STD_LOGIC;
           output : out  STD_LOGIC_VECTOR (15 downto 0));
end debouncing;

architecture Behavioral of debouncing is

signal count: std_logic_vector(15 downto 0):="0000000000000000";  --initilazing the start value of the counter - test relevant
begin

process(clock,count,reset)

begin

if reset='1' then
	count<="0000000000000000";
elsif rising_edge(clock) then
	if enable='1' then
		if count="1111111111111111" then
			count<="0000000000000000";
		else
			count<=count+"0000000000000001";
		end if;
	end if;
end if;
end process;
output<=count;  --runs in parallel with the process!

end Behavioral;
--! @file
--! @author Mariya
----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:17:38 05/02/2012 
-- Design Name: 
-- Module Name:    btn_recognition - Behavioral 
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

entity btn_recognition is
    Port ( clmns : in  STD_LOGIC_VECTOR (3 downto 0);
           rows : in  STD_LOGIC_VECTOR (2 downto 0);
           pressed_btn : out  STD_LOGIC_VECTOR (4 downto 0));
end btn_recognition;

architecture Behavioral of btn_recognition is

begin

	pressed_btn<="00001" when clmns="1000" and rows="001" else		--	key 1
					 "00010" when clmns="0100" and rows="001" else		--	key 2
					 "00011" when clmns="0010" and rows="001" else		--	key 3
					 "00100" when clmns="1000" and rows="010" else		--	key 4
					 "00101" when clmns="0100" and rows="010" else		--	key 5
					 "00110" when clmns="0010" and rows="010" else		--	key 6
					 "00111" when clmns="1000" and rows="011" else		--	key 7
					 "01000" when clmns="0100" and rows="011" else		--	key 8
					 "01001" when clmns="0010" and rows="011" else		--	key 9
					 "00000" when clmns="0100" and rows="100" else		--	key 0
					 "01010" when clmns="1000" and rows="100" else		--	key A
					 "01011" when clmns="0010" and rows="100" else		--	key B
					 "01100" when clmns="0001" and rows="100" else		--	key C
					 "01101" when clmns="0001" and rows="011" else		--	key D
					 "01110" when clmns="0001" and rows="010" else		--	key E
					 "01111" when clmns="0001" and rows="001" else		-- key F
					 "11111";														-- No key pressed!


end Behavioral;


--! @file
--! @author Mariya
----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:02:01 05/02/2012 
-- Design Name: 
-- Module Name:    encoder_rows - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity encoder_rows is
    Port ( enc_in : in  STD_LOGIC_VECTOR (3 downto 0);
           enc_out : out  STD_LOGIC_VECTOR (2 downto 0));
end encoder_rows;

architecture Behavioral of encoder_rows is

begin

enc_out<="001" when enc_in="0001" else
			"010" when enc_in="0010" else
			"011" when enc_in="0100" else
			"100" when enc_in="1000" else
			"000";



end Behavioral;


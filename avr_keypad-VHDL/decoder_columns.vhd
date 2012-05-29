--! @file
--! @author Mariya
----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    08:55:53 05/02/2012 
-- Design Name: 
-- Module Name:    decoder_columns - Behavioral 
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

entity decoder_columns is
    Port ( dec_in : in  STD_LOGIC_VECTOR (1 downto 0);
           dec_out : out  STD_LOGIC_VECTOR (3 downto 0));
end decoder_columns;

architecture Behavioral of decoder_columns is

begin

dec_out<="0001" when dec_in="00" else
			"0010" when dec_in="01" else
			"0100" when dec_in="10" else
			"1000" when dec_in="11";


end Behavioral;


--! @file
--! @author Mariya
----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:13:52 11/13/2011 
-- Design Name: 
-- Module Name:    stm_design - Behavioral 
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

entity stm_debounce is
    Port (  : in  STD_LOGIC;
            : out  STD_LOGIC_VECTOR(1 downto 0));
end stm_debounce;

 architecture Behavioral of stm_debounce is
 
type st_type is (idle, ...);

--attribute ENUM_ENCODING: STRING;     --for manualy encoding of states!
--attribute ENUM_ENCODING of ST_TYPE: type is "00 01 11 10";

signal cst, nst: st_type;

begin

	seq: process(clk, cst)
	begin
		if rising_edge(clk) then
			cst <= nst;
		end if;
	end process;

	comb: process(the inputs, cst)
	begin
		case cst is
		
			when idle =>
							btn_pressed /<= "00000";
							en_ct <= '0'; rst_ct <= '1';
						if encoder /= "000" then 
							nst <= get_row; 
						elsif encoder = "000" then
							nst <= idle;
						end if;
							
			when get_row =>
							btn_pressed <= "00000";
							en_ct <= '1'; rst_ct <= '0';
						if encoder /= "000" and decoder /= "0000" then 
							nst <= check_clmn;
						elsif encoder /= "000" and decoder = "0000" then
						   nst <= get_row;
						else
							nst <= idle;
						end if;
							
			when check_clmn =>
							btn_pressed <= "00000";
							en_ct <= '0'; rst_ct <= '1';
						if encoder /= "000" and decoder /= "0000" then 
							nst <= result;
						elsif encoder /= "000" and decoder = "0000" then 
							nst <= check_clmn;
						else
							nst <= idle;
						end if;
						
			when result =>
							btn_pressed <= "00000";
							en_ct <= '0'; rst_ct <= '1';
--						if encoder /= "000" and decoder /= "0000" then 
--							nst <= idle;
--						else
							nst <= idle;	
--						end if;
						
				
	end case;
	
	end process;


end Behavioral;


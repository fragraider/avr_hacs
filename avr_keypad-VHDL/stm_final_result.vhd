--! @file
--! @author Mariya
----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:25:55 05/29/2012 
-- Design Name: 
-- Module Name:    stm_final_result - Behavioral 
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

entity stm_press is
		Port ( inp_key : in std_logic_vector (3 downto 0);
				out_key : out std_logic_vector(3 downto 0);
				outp_to_AVR : out std_logic_vector(4 downto 0));
end stm_press;

architecture Behavioral of stm_press is

COMPONENT key_press
	PORT(
		in_keypad : IN std_logic_vector(3 downto 0);
		clk : IN std_logic;          
		out_keypad : OUT std_logic_vector(3 downto 0);
		btn_press : OUT std_logic_vector(4 downto 0)
		);
	END COMPONENT;

COMPONENT debouncing
	PORT(
		clock : IN std_logic;
		enable : IN std_logic;
		reset : IN std_logic;          
		output : OUT std_logic_vector(15 downto 0)
		);
	END COMPONENT;

type st_type is (default, second, waiting, fourth, output_button);

signal cst, nst: st_type;

signal old: std_logic_vector (4 downto 0);

signal cnt :  STD_LOGIC;
signal rst,clk1 :  STD_LOGIC;
signal prssd_btn :  STD_LOGIC_VECTOR (4 downto 0);
signal tmr_ok :  STD_LOGIC_VECTOR (15 downto 0);


begin

	Inst_key_press: key_press PORT MAP(in_keypad => inp_key, clk => clk1, out_keypad => out_key, btn_press => prssd_btn);
	
	Inst_debouncing: debouncing PORT MAP(clock => clk1, enable => cnt, reset => rst, output => tmr_ok);

	
		seq: process(clk1, cst)
	begin
		if rising_edge(clk1) then
			cst <= nst;
		end if;
	end process;

comb: process(cnt, rst, inp_key, cst)
	begin
		case cst is
			
				when default =>
										cnt <= '0'; rst <= '1';
										old <= prssd_btn;
										outp_to_AVR <= "00000";
										tmr_ok <= "0000000000000000";
									if inp_key /= "0001" or inp_key /= "0010" or inp_key /= "0100" or inp_key /= "1000" then
										nst <= default;
									else
										nst <= second;
									end if;
										
				when second =>
										cnt <= '0'; rst <= '1';
										old <= prssd_btn;
										outp_to_AVR <= "00000";
										tmr_ok <= "0000000000000000";
										nst <= waiting;
										
				when waiting =>
										cnt <= '1'; rst <= '0';
										old <= prssd_btn;
										outp_to_AVR <= "00000";
										tmr_ok <= "1111111111111111";
									if inp_key = "0001" or inp_key = "0010" or inp_key = "0100" or inp_key = "1000" then
										nst <= fourth;
									else
										nst <= default;
									end if;
									
				when fourth =>
										cnt <= '0'; rst <= '1';
										old <= prssd_btn;
										outp_to_AVR <= "00000";
										tmr_ok <= "0000000000000000";
										nst <= output_button;
								
				when output_button =>
										cnt <= '1'; rst <= '0';
										old <= prssd_btn;
										outp_to_AVR <= prssd_btn;
										tmr_ok <= "0000000000000000";
									if inp_key = "0001" or inp_key = "0010" or inp_key = "0100" or inp_key = "1000" then
										nst <= output_button;
									else
										nst <= default;
									end if;
										
		end case;
		
		end process;

end Behavioral;


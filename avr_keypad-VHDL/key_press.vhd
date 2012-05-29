--! @file
--! @author Mariya
----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:54:56 05/25/2012 
-- Design Name: 
-- Module Name:    key_press - Behavioral 
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

entity key_press is
    Port ( in_keypad : in  STD_LOGIC_VECTOR (3 downto 0);
			  clk : in std_logic;
			  out_keypad : out STD_LOGIC_VECTOR (3 downto 0);
           btn_press : out  STD_LOGIC_VECTOR (4 downto 0));
end key_press;

architecture Behavioral of key_press is

COMPONENT encoder_rows
	PORT(
		enc_in : IN std_logic_vector(3 downto 0);          
		enc_out : OUT std_logic_vector(2 downto 0)
		);
END COMPONENT;

COMPONENT decoder_columns
	PORT(
		dec_in : IN std_logic_vector(1 downto 0);          
		dec_out : OUT std_logic_vector(3 downto 0)
		);
END COMPONENT;

COMPONENT counter
	PORT(
		clk : IN std_logic;
		en_counter : IN std_logic;
		rst_counter : IN std_logic;          
		outp_counter : OUT std_logic_vector(1 downto 0)
		);
END COMPONENT;

COMPONENT btn_recognition
	PORT(
		clmns : IN std_logic_vector(3 downto 0);
		rows : IN std_logic_vector(2 downto 0);          
		pressed_btn : OUT std_logic_vector(4 downto 0)
		);
END COMPONENT;
	
signal r: std_logic_vector(2 downto 0);
signal d: std_logic_vector(1 downto 0);
signal in_col: std_logic_vector(3 downto 0);


begin


	Inst_encoder_rows: encoder_rows PORT MAP(enc_in => in_keypad, enc_out => r);
	
	Inst_counter: counter PORT MAP(clk => clk, en_counter => '1', rst_counter => '0', outp_counter => d);

	Inst_decoder_columns: decoder_columns PORT MAP(dec_in => d, dec_out => in_col);

	Inst_btn_recognition: btn_recognition PORT MAP(clmns => in_col, rows => r, pressed_btn => btn_press);

	out_keypad <= in_col;

end Behavioral;


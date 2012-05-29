--! @file
--! @author Mariya
--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   19:04:36 05/28/2012
-- Design Name:   
-- Module Name:   C:/Xilinx/dige1/avr_keypad/tb_btn_recognition.vhd
-- Project Name:  avr_keypad
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: btn_recognition
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb_btn_recognition IS
END tb_btn_recognition;
 
ARCHITECTURE behavior OF tb_btn_recognition IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT btn_recognition
    PORT(
         clmns : IN  std_logic_vector(3 downto 0);
         rows : IN  std_logic_vector(2 downto 0);
         pressed_btn : OUT  std_logic_vector(4 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clmns : std_logic_vector(3 downto 0) := (others => '0');
   signal rows : std_logic_vector(2 downto 0) := (others => '0');

 	--Outputs
   signal pressed_btn : std_logic_vector(4 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
			signal EndTest : std_logic:='0';

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: btn_recognition PORT MAP (
          clmns => clmns,
          rows => rows,
          pressed_btn => pressed_btn
        );


   -- Stimulus process
   stim_proc: process
   begin		
  
		clmns <= "1000"; 			-- pressed_btn = 00001 -> 1
		rows <= "001";
	wait for 50 ns;
		clmns <= "0100"; 			-- pressed_btn = 00010 -> 2
		rows <= "001";
   wait for 50 ns;
		clmns <= "0010";			-- pressed_btn = 00011 -> 3 
		rows <= "001";
   wait for 50 ns;
		clmns <= "1000"; 			-- pressed_btn = 00100 -> 4
		rows <= "010";
   wait for 50 ns;
		clmns <= "0100"; 			-- pressed_btn = 00101 -> 5
		rows <= "010";
   wait for 50 ns;
		clmns <= "0010"; 			-- pressed_btn = 00110 -> 6
		rows <= "010";
   wait for 50 ns;
		clmns <= "1000"; 			-- pressed_btn = 00111 -> 7
		rows <= "011";
   wait for 50 ns;
		clmns <= "0100"; 			-- pressed_btn = 01000 -> 8
		rows <= "011";
   wait for 50 ns;
		clmns <= "0010"; 			-- pressed_btn = 01001 -> 9
		rows <= "011";
   wait for 50 ns;
		clmns <= "0100"; 			-- pressed_btn = 00000 -> 0
		rows <= "100";
   wait for 50 ns;	
		clmns <= "1000";			-- pressed_btn = 01010 -> A 
		rows <= "100";
   wait for 50 ns;
		clmns <= "0010"; 			-- pressed_btn = 01011 -> B
		rows <= "100";
   wait for 50 ns;
		clmns <= "0001"; 			-- pressed_btn = 01100 -> C
		rows <= "100";
   wait for 50 ns;
		clmns <= "0001"; 			-- pressed_btn = 01101 -> D
		rows <= "011";
   wait for 50 ns;
		clmns <= "0001"; 			-- pressed_btn = 01110 -> E
		rows <= "010";
   wait for 50 ns;
		clmns <= "0001"; 			-- pressed_btn = 01111 -> F
		rows <= "001";
   wait for 50 ns;
		clmns <= "0011"; 			-- pressed_btn = 11111 -> No key pressed
		rows <= "011";
   wait for 50 ns;
		clmns <= "1000"; 			-- pressed_btn -> No key pressed
		rows <= "111";
   wait for 50 ns;
		clmns <= "1101"; 			-- pressed_btn -> No key pressed
		rows <= "101";
   wait for 50 ns;
		clmns <= "0111"; 			-- pressed_btn -> No key pressed
		rows <= "001";

      wait;
		
report "Tested Successfully";
EndTest <= '1';

   end process;
	

END;

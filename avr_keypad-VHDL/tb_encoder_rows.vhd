--! @file
--! @author Mariya
--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:57:28 05/11/2012
-- Design Name:   
-- Module Name:   C:/Xilinx/dige1/avr_keypad/tb_encoder_rows.vhd
-- Project Name:  avr_keypad
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: encoder_rows
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
 
ENTITY tb_encoder_rows IS
END tb_encoder_rows;
 
ARCHITECTURE behavior OF tb_encoder_rows IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT encoder_rows
    PORT(
         enc_in : IN  std_logic_vector(3 downto 0);
         enc_out : OUT  std_logic_vector(2 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal enc_in : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal enc_out : std_logic_vector(2 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: encoder_rows PORT MAP (
          enc_in => enc_in,
          enc_out => enc_out
        );

 

   -- Stimulus process
   stim_proc: process
   begin		
    
      wait for 100 ns;	
	enc_in <= "0001";			-- enc_out must be 001
		wait for 100 ns;
	enc_in <= "0010";			-- enc_out must be 010
		wait for 100 ns;
	enc_in <= "0100";			-- enc_out must be 011
		wait for 100 ns;
	enc_in <= "1000";			-- enc_out must be 100
		wait for 100 ns;
	enc_in <= "0000";			-- enc_out must be 000
		wait for 100 ns;


     

      wait;
   end process;

END;

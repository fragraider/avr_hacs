--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:31:15 05/07/2012
-- Design Name:   
-- Module Name:   C:/Xilinx/dige1/avr_keypad/tb_counter.vhd
-- Project Name:  avr_keypad
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: counter
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
 
ENTITY tb_counter IS
END tb_counter;
 
ARCHITECTURE behavior OF tb_counter IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT counter
    PORT(
         clk : IN  std_logic;
         en_counter : IN  std_logic;
         rst_counter : IN  std_logic;
         outp_counter : OUT  std_logic_vector(1 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal en_counter : std_logic := '0';
   signal rst_counter : std_logic := '0';

 	--Outputs
   signal outp_counter : std_logic_vector(1 downto 0);

		signal EndTest:std_logic:='0';

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: counter PORT MAP (
          clk => clk,
          en_counter => en_counter,
          rst_counter => rst_counter,
          outp_counter => outp_counter
        );

   -- Clock process definitions
   clk_process :process
   begin
		while EndTest='0' loop
			clk <= '0';
			wait for clk_period/2;
			clk <= '1';
			wait for clk_period/2;
		end loop;
		wait;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
     
	  en_counter<='1'; rst_counter<='0';
wait for clk_period;
assert outp_counter="01" report "output is not 01" severity failure;
wait for clk_period;
assert outp_counter="10" report "output is not 10" severity failure;
wait for clk_period;
assert outp_counter="11" report "output is not 11" severity failure;
wait for clk_period;
assert outp_counter="00" report "output is not 00" severity failure;
wait for clk_period;
assert outp_counter="01" report "output is not 01" severity failure;
wait for clk_period;
assert outp_counter="10" report "output is not 10" severity failure;
en_counter<='1'; rst_counter<='1';
wait for clk_period;
en_counter<='1'; rst_counter<='0';
wait for clk_period;
assert outp_counter="01" report "output is not 01" severity failure;
wait for clk_period;
assert outp_counter="10" report "output is not 10" severity failure;
wait for clk_period;
assert outp_counter="11" report "output is not 11" severity failure;
wait for clk_period;
assert outp_counter="00" report "output is not 00" severity failure;
wait for clk_period;
assert outp_counter="01" report "output is not 01" severity failure;
wait for clk_period;
assert outp_counter="10" report "output is not 10" severity failure;
wait for clk_period;
en_counter<='0'; rst_counter<='0';
wait for clk_period;
en_counter<='1'; rst_counter<='0';
assert outp_counter="11" report "output is not 11" severity failure;
wait for clk_period;
assert outp_counter="00" report "output is not 00" severity failure;
wait for clk_period;
assert outp_counter="01" report "output is not 01" severity failure;




report "tested successfully";


EndTest<='1';
wait;
   end process;

END;

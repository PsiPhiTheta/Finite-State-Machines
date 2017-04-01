--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:01:06 11/11/2016
-- Design Name:   
-- Module Name:   P:/Downloads/2nd Year/Semester 1/DSD/Lab 2/ex2/johnson_tb.vhd
-- Project Name:  ex2
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: johnson
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
-- USE ieee.numeric_std.ALL;
 
ENTITY johnson_tb IS
END johnson_tb;
 
ARCHITECTURE behavior OF johnson_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT johnson
    PORT(
         reset : IN  std_logic;
         clk : IN  std_logic;
         q : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal reset : std_logic := '0';
   signal clk : std_logic := '0';

 	--Outputs
   signal q : std_logic_vector(15 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: johnson PORT MAP (
          reset => reset,
          clk => clk,
          q => q
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for clk_period*10;

      -- insert stimulus here
		reset <= '1';
		wait for 100 ns;
		reset <= '0';

      wait;
   end process;

END;

----------------------------------------------------------------------------------
-- Name: Thomas Hollis
-- ID: 9563426
-- Subject: DSD II
-- Uni: University of Manchester
-- Lab: 1
-- Assignment: 3
----------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
  
ENTITY circuit2_tb IS
END circuit2_tb;
 
ARCHITECTURE behavior OF circuit2_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT cwk1
    PORT(
         a : IN  std_logic;
         b : IN  std_logic;
         c : IN  std_logic;
         d : IN  std_logic;
         x : OUT  std_logic;
         y : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal a : std_logic := '0';
   signal b : std_logic := '0';
   signal c : std_logic := '0';
   signal d : std_logic := '0';

 	--Outputs
   signal x : std_logic;
   signal y : std_logic;
   
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: cwk1 PORT MAP (
          a => a,
          b => b,
          c => c,
          d => d,
          x => x,
          y => y
        );

   -- Stimulus process
   stim_proc: process
   begin		
  
	a <= '0', '1' after 80 ns, '0' after 160 ns;
	b <= '0', '1' after 40 ns, '0' after 80 ns, '1' after 120 ns, '0' after 160 ns;
	c <= '0', '1' after 20 ns, '0' after 40 ns, '1' after 60 ns, '0' after 80 ns, '1' after 100 ns, '0' after 120 ns, '1' after 140 ns, '0' after 160 ns;
	d <= '0', '1' after 10 ns, '0' after 20 ns, '1' after 30 ns, '0' after 40 ns, '1' after 50 ns, '0' after 60 ns, '1' after 70 ns, '0' after 80 ns, '1' after 90 ns, '0' after 100 ns, '1' after 110 ns, '0' after 120 ns, '1' after 130 ns, '0' after 140 ns, '1' after 150 ns, '0' after 160 ns;
      wait;
   end process;

END;

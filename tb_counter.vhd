-- Digital Systems Design 2 laboratory, School of EEE, Manchester
-- VHDL Test Bench Created from source file counter.vhd
-- Lab #2 v2012

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY tb_counter IS
END tb_counter;

ARCHITECTURE testbench of tb_counter IS 

	COMPONENT counter
	PORT(
		preset : IN std_logic;
		clk : IN std_logic;
		up : IN std_logic;          
		count : OUT std_logic_vector(7 downto 0)
		);
	END COMPONENT;

	SIGNAL preset :  std_logic;
	SIGNAL clk :  std_logic;
	SIGNAL up :  std_logic;
	SIGNAL count :  std_logic_vector(7 downto 0);

BEGIN

	uut: counter PORT MAP(
		preset => preset,
		clk => clk,
		up => up,
		count => count
	);

-- *** Test Bench - User Defined Section ***
   
   -----------------------------------
   -- 1 MHz clock generation
   -----------------------------------
   clock_gen: process
   begin
     clk <= '1'; wait for 500 ns;
     clk <= '0'; wait for 500 ns;
   end process; --clock_gen
   ----------------------------------- -- why does it loop? -> because process is triggered by everything --

   -----------------------------------
   -- other stimuli
   -----------------------------------
   stimulus_gen: process
   begin
	  -- preset the counter to initialise
	  preset <= '1';
	  -- set it to count up
	  up <= '1';
	  wait for 1.4 us;
     -- stop presetting, the counter should count up from now on...
	  preset <= '0';
	  wait for 4 us;
     -- then try counting down
	  up <= '0';
	  

	  wait for 2.7 us;
	  preset <= '1';	  

	  
	  wait; -- wait forever (makes sure process does not loop)
   end process; -- stimulus_gen
   -----------------------------------

   -----------------------------------
   -- monitor the outputs
   -----------------------------------
   monitor: process
   begin
	  -- first, wait for some time - the initialisation should be ignored in the testbench.
     wait for 1.2 us;
	  -- the counter should preset after first clock edge
	  assert (count = "11111111") report "ERROR - counter did not preset!" severity FAILURE;
	  -- the counter should count up, first it will overflow from 255 to 0
	  
	  wait for 0.4 us;
	  assert (count = "11111111") report "ERROR - should rising-edge triggered" severity FAILURE;	
	  
	  wait for 0.6 us;
	  assert (count = "00000000") report "ERROR - should be counting up" severity FAILURE;
	  -- counter is counting up for next 3 cycles
	  wait for 1 us;
	  assert (count = "00000001") report "ERROR - should be counting up" severity FAILURE;
	  wait for 1 us;
	  assert (count = "00000010") report "ERROR - should be counting up" severity FAILURE;
	  wait for 1 us;
	  assert (count = "00000011") report "ERROR - should be counting up" severity FAILURE;
	  wait for 1 us;
	  assert (count = "00000010") report "ERROR - should be counting down" severity FAILURE;
	  wait for 1 us;
	  assert (count = "00000001") report "ERROR - should be counting down" severity FAILURE;
     
	  wait for 0.8 us; -- at 8us
	  wait for 0.5 us;
	  assert (count = "11111111") report "ERROR - should be asynchronous" severity FAILURE;
	  	  
	  wait for 4 us;
	  -- end of test
	  
	  
	  -- the following line will generate FAILURE. This is used to terminate the simulation. 
	  assert FALSE report "All tests OK. End of simulation (not a failure)" severity FAILURE;
   
	end process; -- monitor
   -----------------------------------


-- *** End Test Bench - User Defined Section ***

end;

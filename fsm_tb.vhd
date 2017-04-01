LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
 
ENTITY fsm_tb IS
END fsm_tb;
 
ARCHITECTURE behavior OF fsm_tb IS 

    COMPONENT fsm
    PORT(
         clock : IN  std_logic;
         reset : IN  std_logic;
         i : IN  std_logic_vector(1 downto 0);
         x : OUT  std_logic;
         y : OUT  std_logic;
         z : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clock : std_logic := '0';
   signal reset : std_logic := '0';
   signal i : std_logic_vector(1 downto 0) := (others => '0');

 	--Outputs
   signal x : std_logic;
   signal y : std_logic;
   signal z : std_logic;

BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: fsm PORT MAP (
          clock => clock,
          reset => reset,
          i => i,
          x => x,
          y => y,
          z => z
        );

----------------- Test Bench - User Defined Section ----------------- 

   -- Clock process definitions
   clock_process: process
   begin
     clock <= '1'; wait for 500 ns;
     clock <= '0'; wait for 500 ns;
   end process; --clock_gen
 

   -- Stimulus process____________________________________________________________
   stim_proc: process
   begin		
       -- reset the FSM to initialise
	  reset <= '1';
	  wait for 1.1 us;
	  -- stop resetting, the FSM should work from now on...
	  reset <= '0';
	  
     -- set i to go through all the states
	  i <= "11"; wait for 0.9 us; --s2tos2
	  i <= "01"; wait for 1 us; --s2tos2
	  i <= "00"; wait for 1 us; --s2tos3
	  
	  i <= "11"; wait for 1 us; --s3tos3
	  i <= "01"; wait for 1 us; --s3tos3
	  i <= "00"; wait for 1 us; --s3tos3
	  i <= "10"; wait for 1 us; --s3tos4
	  
	  i <= "01"; wait for 1 us; --s4tos4
	  i <= "11"; wait for 1 us; --s4tos4
	  i <= "00"; wait for 1 us; --s4tos2
	  i <= "10"; wait for 1 us; --s2tos4
     i <= "10"; wait for 1 us; --s4tos5
	  
	  i <= "11"; wait for 1 us; --s5tos5
	  i <= "10"; wait for 1 us; --s5tos4
	  i <= "10"; wait for 1 us; --s4tos5
	  i <= "01"; wait for 1 us; --s5tos2
	  i <= "10"; wait for 1 us; --s2tos4
	  i <= "10"; wait for 1 us; --s4tos5
	  i <= "00"; wait for 1 us; --s5tos1
	  
	  i <= "11"; wait for 1 us; --s1tos1
	  i <= "00"; wait for 1 us; --s1tos1
	  i <= "01"; wait for 1 us; --s1tos1
	  i <= "10"; wait for 1 us; --s1tos2
	  
	  i <= "10"; wait for 1.25 us; --s2tos4
	  reset <= '1'; --s4 reset to s2

     wait;
   end process;
	
	-- Monitor the outputs_________________________________________________________
   monitor: process
   begin
	  -- first, wait for some time - the initialisation should be ignored in the testbench.
     wait for 2.5 us;
	  assert (x = '1' and y = '1' and z = '0') report "ERROR 1" severity FAILURE; wait for 1 us;
	  assert (x = '1' and y = '1' and z = '0') report "ERROR 2" severity FAILURE; 
	  
	  wait for 0.3 us;
	  assert (x = '1' and y = '1' and z = '0') report "ERROR clock edge" severity FAILURE;
	  
	  wait for 0.7 us;
	  assert (x = '0' and y = '0' and z = '0') report "ERROR 3" severity FAILURE; wait for 1 us;
	  
	  assert (x = '0' and y = '0' and z = '0') report "ERROR 4" severity FAILURE; wait for 1 us;
	  assert (x = '0' and y = '0' and z = '0') report "ERROR 5" severity FAILURE; wait for 1 us;
	  assert (x = '0' and y = '0' and z = '0') report "ERROR 6" severity FAILURE; wait for 1 us;
	  assert (x = '0' and y = '0' and z = '1') report "ERROR 7" severity FAILURE; wait for 1 us;
	  
	  assert (x = '0' and y = '0' and z = '1') report "ERROR 8" severity FAILURE; wait for 1 us;
	  assert (x = '0' and y = '0' and z = '1') report "ERROR 9" severity FAILURE; wait for 1 us;
	  assert (x = '1' and y = '1' and z = '0') report "ERROR 10" severity FAILURE; wait for 1 us;
	  assert (x = '0' and y = '0' and z = '1') report "ERROR 11" severity FAILURE; wait for 1 us;
	  assert (x = '1' and y = '1' and z = '1') report "ERROR 12" severity FAILURE; wait for 1 us;
	  
	  assert (x = '1' and y = '1' and z = '1') report "ERROR 13" severity FAILURE; wait for 1 us;
	  assert (x = '0' and y = '0' and z = '1') report "ERROR 14" severity FAILURE; wait for 1 us;
	  assert (x = '1' and y = '1' and z = '1') report "ERROR 15" severity FAILURE; wait for 1 us;
	  assert (x = '1' and y = '1' and z = '0') report "ERROR 16" severity FAILURE; wait for 1 us;
	  assert (x = '0' and y = '0' and z = '1') report "ERROR 17" severity FAILURE; wait for 1 us;
	  assert (x = '1' and y = '1' and z = '1') report "ERROR 18" severity FAILURE; wait for 1 us;
	  assert (x = '0' and y = '1' and z = '1') report "ERROR 19" severity FAILURE; wait for 1 us;
	  
	  assert (x = '0' and y = '1' and z = '1') report "ERROR 20" severity FAILURE; wait for 1 us;
	  assert (x = '0' and y = '1' and z = '1') report "ERROR 21" severity FAILURE; wait for 1 us;
	  assert (x = '0' and y = '1' and z = '1') report "ERROR 22" severity FAILURE; wait for 1 us;
	  assert (x = '1' and y = '1' and z = '0') report "ERROR 23" severity FAILURE; wait for 0.6 us;
	  
	  assert (x = '0' and y = '0' and z = '1') report "ERROR 24" severity FAILURE; 
	  
	  -- check other things like sync t=25.1us
	  wait for 0.3 us; --t=25.75us
	  assert (x = '0' and y = '0' and z = '1') report "ERROR 25 - not synchronous" severity FAILURE; wait for 1 us;
	  wait for 4 us;
	  	  
	  -- the following line will generate FAILURE. This is used to terminate the simulation. 
	  wait for 1 us;
	  assert FALSE report "All tests OK. End of simulation (not a failure)" severity FAILURE;
   
	end process; -- monitor

END;

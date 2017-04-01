LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
 
ENTITY mystery_tb IS
END mystery_tb;
 
ARCHITECTURE behavior OF mystery_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT mystery
    PORT(
         clk : IN  std_logic;
         rst : IN  std_logic;
         a : IN  std_logic;
         b : IN  std_logic;
         c : OUT  std_logic;
         d : OUT  std_logic;
         e : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';
   signal a : std_logic := '0';
   signal b : std_logic := '0';

 	--Outputs
   signal c : std_logic;
   signal d : std_logic;
   signal e : std_logic;

   -- Clock period definitions
   constant clk_period : time := 0.5 us;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: mystery PORT MAP (
          clk => clk,
          rst => rst,
          a => a,
          b => b,
          c => c,
          d => d,
          e => e
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
		rst <= '1';
		wait for 100 ns;
		rst <= '0';

      wait;
   end process;

END;

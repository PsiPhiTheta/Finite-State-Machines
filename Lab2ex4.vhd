-- Digital Systems Design 2 laboratory, School of EEE, Manchester
-- mystery component
-- Lab #2 v2012

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mystery is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           a : in  STD_LOGIC;
           b : in  STD_LOGIC;
           c : out  STD_LOGIC;
           d : out  STD_LOGIC;
           e : out  STD_LOGIC);
end mystery;

architecture Black_Box_Wrapper of mystery is

 attribute box_type : string;
 
 COMPONENT mc
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
    attribute box_type of mc :component is "black_box";
	 
begin

ip_core: mc PORT MAP (
          clk => clk,
          rst => rst,
          a => a,
          b => b,
          c => c,
          d => d,
          e => e
        );

end Black_Box_Wrapper;


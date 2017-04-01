library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity fsm is
    Port ( clock : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           i : in  STD_LOGIC_VECTOR (1 downto 0);
           x : out  STD_LOGIC;
           y : out  STD_LOGIC;
           z : out  STD_LOGIC);
end fsm;

architecture Behavioral of fsm is
------------------- 00. STATE DEFINITIONS -------------------
	type stateval is (s1, s2, s3, s4, s5);
   signal state, next_state: stateval;


begin 
------------------- 01. STATE REGISTER -------------------
process (clock, reset)
   begin
		if rising_edge(clock) then 
			if (reset = '1') then state <= s2; else state <= next_state; end if;
		end if;
end process;

------------------- 02. NEXT STATE LOGIC -------------------
process (state,i)
   begin
      case state is
         when s1 => if(i="10") then next_state <= s2; else next_state <= s1; end if;
         when s2 => if(i="10") then next_state <= s4; elsif (i="00") then next_state <= s3; else next_state <= s2; end if;
         when s3 => if(i="10") then next_state <= s4; else next_state <= s3; end if;
			when s4 => if(i="10") then next_state <= s5; elsif (i="00") then next_state <= s2; else next_state <= s4; end if;
			when s5 => if(i="10") then next_state <= s4; elsif (i="00") then next_state <= s1; elsif (i="01") then next_state <= s2; else next_state <= s5; end if;
			when others => next_state <= s2;
		end case;
end process;

------------------- 03. OUTPUT LOGIC -------------------
x <= '1' when (state = s2) or (state = s5) else '0';
y <= '1' when (state = s1) or (state = s2) or (state = s5) else '0';
z <= '1' when (state = s1) or (state = s4) or (state = s5) else '0';

end Behavioral;


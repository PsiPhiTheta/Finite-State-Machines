-- Digital Systems Design 2 laboratory, School of EEE, Manchester
-- counter
-- Lab #2 v2012

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

entity counter is
    port ( preset : in std_logic;
           clk    : in std_logic;
           up     : in std_logic;
           count  : out std_logic_vector (7 downto 0));
end counter;

architecture behavioural of counter is
signal q : unsigned (7 downto 0);
begin 

  counter: process (preset, clk)
  begin
    if (preset = '1') then -- for asynchronous add: AND rising_edge (clk)
        q <= (others => '1'); -- sets all bits of q to 1
    elsif rising_edge (clk) then
        if up = '1' then 
          q <= q + 1;
        else
          q <= q - 1;
	     end if;
    end if;	
  end process;

  count <= std_logic_vector (q);

end behavioural;



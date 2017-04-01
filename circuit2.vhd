----------------------------------------------------------------------------------
-- Name: Thomas Hollis
-- ID: 9563426
-- Subject: DSD II
-- Uni: University of Manchester
-- Lab: 1
-- Assignment: 3
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity cwk1 is
    Port ( a : in  STD_LOGIC;
           b : in  STD_LOGIC;
           c : in  STD_LOGIC;
           d : in  STD_LOGIC;
           x : out  STD_LOGIC;
           y : out  STD_LOGIC);
end cwk1;

architecture Behavioral of cwk1 is
signal q : std_logic;
signal r : std_logic;
signal s : std_logic;
signal t : std_logic;
begin
 q <= NOT d;
 r <= a OR b;
 s <= c when q = '1' else a when q ='0' else 'Z';
 t <= NOT (r OR q OR s);
 x <= r;
 y <= t XOR a;
end Behavioral;


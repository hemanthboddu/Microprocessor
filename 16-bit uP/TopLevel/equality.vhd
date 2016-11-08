library ieee;
use ieee.std_logic_1164.all;
library work;
use iEEE.numeric_STD.ALL;

entity equality is
	port(
	     a : in std_logic_vector(15 downto 0);
	     b : in std_logic_vector(15 downto 0);
	     --alu_out : out std_logic_vector(15 downto 0);
	     --c : out std_logic_vector(0 downto 0);
	     z : out std_logic
	);
end entity;
architecture behave of equality is
begin
process(a,b)
begin
	if a = b then
		z <= '0';
	else z <= '1';
	end if;
end process;
end behave;
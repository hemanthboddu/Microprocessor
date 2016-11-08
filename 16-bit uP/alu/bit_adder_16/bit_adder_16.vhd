library ieee;
use ieee.std_logic_1164.all;
library work;
use iEEE.numeric_STD.ALL;

entity bit_adder_16 is
	port(
	     a : in std_logic_vector(15 downto 0);
	     b : in std_logic_vector(15 downto 0);
	     alu_out : out std_logic_vector(15 downto 0)
	);
end entity;
architecture behave of bit_adder_16 is
begin
process(a,b)
begin
	alu_out <= std_logic_vector(signed(a)+signed(b));
end process;
end behave;

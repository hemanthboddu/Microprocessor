library ieee;
use ieee.std_logic_1164.all;
library work;
use iEEE.numeric_STD.ALL;

entity nand_16 is
	port(
	     a : in std_logic_vector(15 downto 0);
	     b : in std_logic_vector(15 downto 0);
	     alu_out : out std_logic_vector(15 downto 0)
	);
end entity;
architecture behave of nand_16 is
begin
process(a,b)
begin
	alu_out <= a nand b;
end process;
end behave;

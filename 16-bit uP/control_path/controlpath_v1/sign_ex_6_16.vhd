library ieee;
use ieee.std_logic_1164.all;
library work;
use iEEE.numeric_STD.ALL;

entity sign_ex_6_16 is
	port(
	     a : in std_logic_vector(5 downto 0);
	     enable : in std_logic;
	     alu_out : out std_logic_vector(15 downto 0)
	);
end entity;
architecture behave of sign_ex_6_16 is
begin
process(a,enable)

begin
if (enable = '1') then
		alu_out(5) <= a(5);
		alu_out(6) <= a(5);
		alu_out(7) <= a(5);
		alu_out(8) <= a(5);
		alu_out(9) <= a(5);
		alu_out(10) <= a(5);
		alu_out(11) <= a(5);
		alu_out(12) <= a(5);
		alu_out(13) <= a(5);
		alu_out(14) <= a(5);
		alu_out(15) <= a(5);
	
		alu_out(0) <= a(0);
		alu_out(1) <= a(1);
		alu_out(2) <= a(2);
		alu_out(3) <= a(3);
		alu_out(4) <= a(4);
end if;
end process;
end behave;

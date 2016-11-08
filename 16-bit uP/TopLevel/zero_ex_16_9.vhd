library ieee;
use ieee.std_logic_1164.all;
library work;
use iEEE.numeric_STD.ALL;

entity zero_ex_16_9 is
	port(
	     a : in std_logic_vector(8 downto 0);
	     alu_out : out std_logic_vector(15 downto 0);
	     enable : in std_logic
	);
end entity;
architecture behave of zero_ex_16_9 is
begin
process(a,enable)

begin
if enable = '1' then
	alu_out(0) <= '0' ;
	alu_out(1) <= '0' ;
	alu_out(2) <= '0' ;
	alu_out(3) <= '0' ;
	alu_out(4) <= '0' ;
	alu_out(5) <= '0' ;
	alu_out(6) <= '0' ;
	alu_out(7) <= a(0);
	alu_out(8) <= a(1);
	alu_out(9) <= a(2);
	alu_out(10) <= a(3);
	alu_out(11) <= a(4);
	alu_out(12) <= a(5);
	alu_out(13) <= a(6);
	alu_out(14) <= a(7);
	alu_out(15) <= a(8);
else 
	alu_out <= "UUUUUUUUUUUUUUUU";
end if;
end process;
end behave;
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
	for i in 0 to 6 loop
		alu_out(i) <= '0';
		end loop;
	for i in 7 to 15 loop
		alu_out(i) <= a(i-7);
		end loop;
end if;
end process;
end behave;

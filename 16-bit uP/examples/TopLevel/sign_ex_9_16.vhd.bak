library ieee;
use ieee.std_logic_1164.all;
library work;
use iEEE.numeric_STD.ALL;

entity sign_ex_9_16 is
	port(
	     a : in std_logic_vector(8 downto 0);
	     enable : in std_logic;
	     alu_out : out std_logic_vector(15 downto 0)
	);
end entity;
architecture behave of sign_ex_9_16 is
begin
process(a,enable)

begin
if (enable = '1') then
	for i in 8 to 15 loop
		alu_out(i) <= a(8);
		end loop;
	for i in 0 to 7 loop
		alu_out(i) <= a(i);
		end loop;
end if;
end process;
end behave;

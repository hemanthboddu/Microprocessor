library ieee;
use ieee.std_logic_1164.all;
library work;
use iEEE.numeric_STD.ALL;

entity mux2_1 is
	port(
	     a0 : in std_logic_vector(15 downto 0);
	     a1 : in std_logic_vector(15 downto 0);
	     control : in std_logic;
	     c : out std_logic_vector(15 downto 0)
	);
end entity;

architecture behave of mux2_1 is
begin
process(control,a0,a1)
begin
if control = '0' then
	c <= a0;
else
	c <= a1;
end if;

end process;
end behave;

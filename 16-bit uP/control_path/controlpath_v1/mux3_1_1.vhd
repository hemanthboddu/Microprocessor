library ieee;
use ieee.std_logic_1164.all;
library work;
use iEEE.numeric_STD.ALL;

entity mux3_1_1 is
	port(
	     a0 : in std_logic_vector(2 downto 0);
	     a1 : in std_logic_vector(2 downto 0);
	     a2 : in std_logic_vector(2 downto 0);
	     control : in std_logic_vector(1 downto 0);
	     c : out std_logic_vector(2 downto 0)
	);
end entity;

architecture behave of mux3_1_1 is
begin
process(control,a1,a2,a0)
begin
if control = "00" then
	c <= a0;
elsif control = "01" then
	c <= a1;
elsif control = "10" then
	c <= a2;
end if;

end process;
end behave;

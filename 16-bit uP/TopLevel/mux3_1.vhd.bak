library ieee;
use ieee.std_logic_1164.all;
library work;
use iEEE.numeric_STD.ALL;

entity mux3_1 is
	port(
	     a0 : in std_logic_vector(15 downto 0);
	     a1 : in std_logic_vector(15 downto 0);
	     a2 : in std_logic_vector(15 downto 0);
	     control : in std_logic_vector(1 downto 0);
	     c : out std_logic_vector(15 downto 0)
	);
end entity;

architecture behave of mux3_1 is

begin
	
process(control,a0,a1,a2)
begin
 
case control is
when "00" =>
	c <= a0;
when "01" =>
	c <= a1;
when "10" =>
	c <= a2;
when others =>
end case;
end process;
end behave;

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
variable out1 : std_logic_vector(2 downto 0); 
begin
case control is
when "00" =>
	out1 := a0;
when "01" =>
	out1 := a1;
when "10" =>
	out1 := a2;
when others=>
	out1 := "UUU";
end case;
	c <= out1;
end process;
end behave;

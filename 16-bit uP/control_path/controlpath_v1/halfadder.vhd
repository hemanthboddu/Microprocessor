library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Components_project.all;
use iEEE.numeric_STD.ALL;

entity halfadder is --*we are defining the inputs and outputs for halfadder
	port( A,B : in std_logic;
	 sum,Cout : out std_logic);
end halfadder;

architecture halfadder of halfadder is 

	component xorGate is --*including the component xorGate 
	 port(A,B : in std_logic;
		F : out std_logic);
	end component;

begin 
	sum <= A xor B;
	Cout <= A and B;
end halfadder;

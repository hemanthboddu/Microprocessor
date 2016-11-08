library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Components_project.all;
use iEEE.numeric_STD.ALL;

entity bit16adder is 
   port(
   		x,y : in std_logic_vector(15 downto 0);
		s : out std_logic_vector(15 downto 0);
		carry : out std_logic
		);
end bit16adder;

architecture bit16adder of bit16adder is 
	signal c : std_logic_vector(16 downto 1); --*we declare all the intermediate carry signal starting from right
	
begin
	G1: halfadder port map(x(0),y(0),s(0),c(1));
	G2: fulladder port map(x(1),y(1),c(1),s(1),c(2));
	G3: fulladder port map(x(2),y(2),c(2),s(2),c(3));
	G4: fulladder port map(x(3),y(3),c(3),s(3),c(4));
	G5: fulladder port map(x(4),y(4),c(4),s(4),c(5));
	G6: fulladder port map(x(5),y(5),c(5),s(5),c(6));
	G7: fulladder port map(x(6),y(6),c(6),s(6),c(7));
	G8: fulladder port map(x(7),y(7),c(7),s(7),c(8));
	G9: fulladder port map(x(8),y(8),c(8),s(8),c(9));
	G10: fulladder port map(x(9),y(9),c(9),s(9),c(10));
	G11: fulladder port map(x(10),y(10),c(10),s(10),c(11));
	G12: fulladder port map(x(11),y(11),c(11),s(11),c(12));
	G13: fulladder port map(x(12),y(12),c(12),s(12),c(13));
	G14: fulladder port map(x(13),y(13),c(13),s(13),c(14));
	G15: fulladder port map(x(14),y(14),c(14),s(14),c(15));
	G16: fulladder port map(x(15),y(15),c(15),s(15),c(16));
	carry <= c(16);
end bit16adder;

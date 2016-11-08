library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Components_project.all;
use iEEE.numeric_STD.ALL;


entity fulladder is --*we define the i/o's for fulladder
   port ( A,B,Cin : in std_logic;
         sum,Cout : out std_logic);
end fulladder;

architecture fulladder of fulladder is

   component halfadder is --*we import halfadder entity
	port(A,B : in std_logic;
	sum,Cout : out std_logic);
   end component;
	
	signal halftohalf, halftoOr1, halftoOr2: std_logic; --*we define intermediate signals and they are neither input nor output signals

begin
	G1 : halfadder port map(A,B, halftohalf, halftoOr1);
	G2 : halfadder port map(Cin,halftohalf, sum, halftoOr2);
	Cout<= halftoOr1 or halftoOr2;
end fulladder;

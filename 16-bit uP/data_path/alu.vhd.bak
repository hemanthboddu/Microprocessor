library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library work;
use work.Components_project.all;
use IEEE.numeric_STD.ALL;

entity ALU is
    Port ( enable : in std_logic;
           a : in  STD_LOGIC_VECTOR (15 downto 0);
           b : in  STD_LOGIC_VECTOR (15 downto 0);
           alu_out : out  STD_LOGIC_VECTOR (15 downto 0);
           control : in  STD_LOGIC_VECTOR (1 downto 0);
           c : out  STD_LOGIC;
           z : out  STD_LOGIC;
           l : out  STD_LOGIC);
end ALU;

architecture Behavioral of ALU is
signal v1 : std_logic_vector(15 downto 0);
signal v2 : std_logic_vector(15 downto 0);
signal v3 :std_logic;

begin
	i1 : bit16adder port map(
				x => a,
				y => b,
				s => v1,
				carry => c
				);
	i2 : nand_16 port map(
				a => a,
				b => b,
				alu_out => v2
				);
	i3 : equality port map(
				a => a,
				b => b,
				z => v3
				);
process (enable,a,b,control) is
begin
if(enable = '1') then 
case control is
when "00" =>
	alu_out <= v1;

when "01" => 
	alu_out <= v2;
	
when "10" =>
	l <= v3;
	
when others =>

end case;
end if;
end process;
end Behavioral;

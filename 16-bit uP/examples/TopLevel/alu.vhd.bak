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
           eqflag : out  STD_LOGIC);
end ALU;

architecture Behavioral of ALU is
signal v1 : std_logic_vector(15 downto 0);
signal v2 : std_logic_vector(15 downto 0);
signal v3,carr :std_logic;
constant init : std_logic_vector(15 downto 0):= "0000000000000000";
begin

process (enable,a,b,control,v1,v2,v3,carr) is
begin
	alu_out <= init;
if(enable = '1') then 
case control is
when "00" =>
	alu_out <= v1;
	c <= carr;
	eqflag <= '0';
	if v1 = "0000000000000000" then
		z <= '1';
	else
		z <= '0';
	end if;
when "01" => 
	alu_out <= v2;
	eqflag <= '0';
	c <= '0';
	if v2 = "0000000000000000" then
		z <= '1';
	else
		z <= '0';
	end if;
when "10" =>
	eqflag <= v3;
	c <= '0';
	z <= '0';
when others =>

end case;
else
	alu_out <= init;
	c <= '0';
	z <= '0';
	eqflag <= '0';
end if;
end process;
	i1 : bit16adder port map(
				x => a,
				y => b,
				s => v1,
				carry => carr
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
end Behavioral;

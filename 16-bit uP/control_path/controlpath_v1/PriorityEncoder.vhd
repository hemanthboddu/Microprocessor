library ieee;
use ieee.std_logic_1164.all;
library work;
use iEEE.numeric_STD.ALL;

entity PriorityEncoder is
port ( x : in std_logic_vector(7 downto 0) ;
enable : in std_logic;
s : out std_logic_vector(2 downto 0) ; 
N : out std_logic ;
y : out std_logic_vector(7 downto 0) ) ;
end PriorityEncoder ;

architecture behave of PriorityEncoder is
begin
process(x,enable)
begin
if (enable = '1') then
N <= not ( x(7) or x(6) or x(5) or x(4) or x(3) or x(2) or x(1) or x(0) ) ;
y <= x;

if x(0) = '0' then
	if x(1) = '0' then
		if x(2) = '0' then
			if x(3) = '0' then
				if x(4) = '0' then
					if x(5) = '0' then
						if x(6) = '0' then
							if x(7) = '0' then
							end if;
						else y(6) <= '0';
						end if;
					else y(5) <= '0';
					end if;
				else y(4) <= '0';
				end if;
			else y(3) <= '0';
			end if;
		else y(2) <= '0';
		end if;
	else y(1) <= '0';
	end if;
else y(0) <= '0';
end if;

s(0) <= ( x(1) and not x(0) ) or
( x(3) and not x(2) and not x(1) and not x(0) ) or
( x(5) and not x(4) and not x(3) and not x(2) and not x(1) and not x(0) ) or
( x(7) and not x(6) and not x(5) and not x(4) and not x(3) and not x(2) and not x(1)
and not x(0) ) ;

s(1) <= ( x(2) and not x(1) and not x(0) ) or
( x(3) and not x(2) and not x(1) and not x(0) ) or
( x(6) and not x(5) and not x(4) and not x(3) and
not x(2) and not x(1) and not x(0) ) or
( x(7) and not x(6) and not x(5) and not x(4) and
not x(3) and not x(2) and not x(1) and not x(0) ) ;

s(2) <= ( x(4) and not x(3) and not x(2) and
not x(1) and not x(0) ) or
( x(5) and not x(4) and not x(3) and not x(2) and
not x(1) and not x(0) ) or
( x(6) and not x(5) and not x(4) and not x(3)
and not x(2) and not x(1) and not x(0) ) or
( x(7) and not x(6) and not x(5) and not x(4) and not x(3)
and not x(2) and not x(1) and not x(0) ) ;

end if;
end process;
end behave ;

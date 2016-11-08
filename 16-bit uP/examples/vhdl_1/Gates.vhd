library ieee;
use ieee.std_logic_1164.all;
entity INVERTER is
  port (a: in std_ulogic;
         b: out std_ulogic);
end entity INVERTER;
architecture Behave of INVERTER is
begin
  b <= not a;
end Behave;


library ieee;
use ieee.std_logic_1164.all;
entity AND2 is
  port (a, b: in std_ulogic;
         c: out std_ulogic);
end entity AND2;
architecture Behave of AND2 is
begin
  c <= a and b;
end Behave;


library ieee;
use ieee.std_logic_1164.all;
entity OR2 is
  port (a, b: in std_ulogic;
         c: out std_ulogic);
end entity OR2;
architecture Behave of OR2 is
begin
  c <= a or b;
end Behave;

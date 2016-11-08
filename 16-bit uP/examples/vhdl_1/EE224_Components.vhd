library std;
use std.standard.all;

library ieee;
use ieee.std_logic_1164.all;

package EE224_Components is
   component INVERTER is
	port (a: in std_logic; b : out std_logic);
   end component;
   component AND2 is
	port (a, b: in std_logic; c : out std_logic);
   end component;
   component OR2 is
	port (a, b: in std_logic; c : out std_logic);
   end component;
end EE224_Components;

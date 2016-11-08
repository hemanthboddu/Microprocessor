library ieee;
use ieee.std_logic_1164.all;
library work;
use work.EE224_Components.all;

entity TwoBitAdder is
   port(x1,x0,y1,y0: in std_logic;
        s1,s0: out std_logic);
end entity;
architecture Struct of TwoBitAdder is
   signal w, z, g1, g2, g3, g4, g5, g6: std_logic;
   signal g7, g8, g9, g10, g11, g12: std_logic;
begin
   -- s0 <= (y0 and (not x0)) or ((not y0) and x0);
   i1: INVERTER port map (a => x0, b => g1);
   i2: INVERTER port map (a => y0, b => g2);
   a1: AND2 port map (a => y0, b => g1, c => g3);
   a2: AND2 port map (a => g2, b => x0, c => g4);
   o1: OR2 port map (a => g3, b => g4, c=> s0);
   
   -- w  <= (y1 and (not x1)) or ((not y1) and x1);
   i3: INVERTER port map (a => x1, b => g5);
   i4: INVERTER  port map (a => y1, b => g6);
   a3: AND2 port map (a => y1, b => g5, c => g7);
   a4: AND2 port map (a => g6, b => x1, c => g8);
   o2: OR2 port map (a => g7, b => g8, c => w);

   -- z  <= (y0 and x0);
   a5: AND2 port map (a => y0, b => x0, c => z);

  
   -- s1 <= (w  and (not z)) or ((not w) and z);
   i5: INVERTER port map (a => z, b => g9);
   i6: INVERTER port map (a => w, b => g10);
   a6: AND2 port map (a=>w, b=> g9, c=> g11);
   a7: AND2 port map (a=>g10, b=> z, c=> g12);
   o3: OR2 port map (a => g11, b => g12, c => s1);

end Struct;

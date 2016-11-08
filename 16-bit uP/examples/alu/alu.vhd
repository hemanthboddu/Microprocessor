library ieee;
use ieee.std_logic_1164.all;

entity alu is
   port(x0,x1,x2,x3,x4,x5,x6,x7,y0,y1,y2,y3,y4,y5,y6,y7,op1,op0: in bit;
        s0,s1,s2,s3,s4,s5,s6,s7: out bit);
end entity;

architecture Struct of alu is
   
	begin
	process(x0,x1,x2,x3,x4,x5,x6,x7,y0,y1,y2,y3,y4,y5,y6,y7,op1,op0)
   variable w0,w1,w2,w3,w4,w5,w6,w7,z0,z1,z2,z3,z4,z5,z6,z7,c0,c1,c2,c3,c4,c5,c6,c7: bit;
begin

if  op1='0' and op0='0'  	then

   z1 := (y1 and (not x1)) or ((not y1) and x1);
   z2 := (y2 and (not x2)) or ((not y2) and x2);
   z3 := (y3 and (not x3)) or ((not y3) and x3);
   z4 := (y4 and (not x4)) or ((not y4) and x4);
   z5 := (y5 and (not x5)) or ((not y5) and x5);
   z6 := (y6 and (not x6)) or ((not y6) and x6);
   z7 := (y7 and (not x7)) or ((not y7) and x7);

   w1 := (x0 and y0);
   w2 := ((w1 and z1) or (x1 and y1));
   w3 := ((w2 and z2) or (x2 and y2));
   w4 := ((w3 and z3) or (x3 and y3));
   w5 := ((w4 and z4) or (x4 and y4));
   w6 := ((w5 and z5) or (x5 and y5));
   w7 := ((w6 and z6) or (x6 and y6));

   s0 <= (y0 and (not x0)) or ((not y0) and x0);
   s1 <= (z1 and (not w1)) or ((not z1) and w1);
   s2 <= (z2 and (not w2)) or ((not z2) and w2);
   s3 <= (z3 and (not w3)) or ((not z3) and w3);
   s4 <= (z4 and (not w4)) or ((not z4) and w4);
   s5 <= (z5 and (not w5)) or ((not z5) and w5);
   s6 <= (z6 and (not w6)) or ((not z6) and w6);
   s7 <= (z7 and (not w7)) or ((not z7) and w7);
elsif op1='0' and op0='1' then
   
	z1 := (not y1);
   z2 := (not y2);
   z3 := (not y3);
   z4 := (not y4);
   z5 := (not y5);
   z6 := (not y6);
   z7 := (not y7);

   w1 := ('1' and (not y0));
   w2 := (w1 and z1);
   w3 := (w2 and z2);
   w4 := (w3 and z3);
   w5 := (w4 and z4);
   w6 := (w5 and z5);
   w7 := (w6 and z6);

   c0 := y0;
   c1 := (z1 and (not w1)) or ((not z1) and w1);
   c2 := (z2 and (not w2)) or ((not z2) and w2);
   c3 := (z3 and (not w3)) or ((not z3) and w3);
   c4 := (z4 and (not w4)) or ((not z4) and w4);
   c5 := (z5 and (not w5)) or ((not z5) and w5);
   c6 := (z6 and (not w6)) or ((not z6) and w6);
   c7 := (z7 and (not w7)) or ((not z7) and w7);
   
   z1 := (c1 and (not x1)) or ((not c1) and x1);
   z2 := (c2 and (not x2)) or ((not c2) and x2);
   z3 := (c3 and (not x3)) or ((not c3) and x3);
   z4 := (c4 and (not x4)) or ((not c4) and x4);
   z5 := (c5 and (not x5)) or ((not c5) and x5);
   z6 := (c6 and (not x6)) or ((not c6) and x6);
   z7 := (c7 and (not x7)) or ((not c7) and x7);

   w1 := (x0 and c0);
   w2 := ((w1 and z1) or (x1 and c1));
   w3 := ((w2 and z2) or (x2 and c2));
   w4 := ((w3 and z3) or (x3 and c3));
   w5 := ((w4 and z4) or (x4 and c4));
   w6 := ((w5 and z5) or (x5 and c5));
   w7 := ((w6 and z6) or (x6 and c6));

   s0 <= (c0 and (not x0)) or ((not c0) and x0);
   s1 <= (z1 and (not w1)) or ((not z1) and w1);
   s2 <= (z2 and (not w2)) or ((not z2) and w2);
   s3 <= (z3 and (not w3)) or ((not z3) and w3);
   s4 <= (z4 and (not w4)) or ((not z4) and w4);
   s5 <= (z5 and (not w5)) or ((not z5) and w5);
   s6 <= (z6 and (not w6)) or ((not z6) and w6);
   s7 <= (z7 and (not w7)) or ((not z7) and w7);

elsif op1='1' and op0='0' then
   
w7 := (y2 and '0') or (x7 and not y2);
      w6 := (y2 and '0') or (x6 and not y2);
      w5 := (y2 and '0') or (x5 and not y2);
      w4 := (y2 and '0') or (x4 and not y2);
      w3 := (y2 and x7) or (x3 and not y2);
      w2 := (y2 and x6) or (x2 and not y2);
      w1 := (y2 and x5) or (x1 and not y2);
      w0 := (y2 and x4) or (x0 and not y2);

-- 2 unit shift
      z7 := (y1 and '0') or (w7 and not y1);
      z6 := (y1 and '0') or (w6 and not y1);
      z5 := (y1 and w7) or (w5 and not y1);
      z4 := (y1 and w6) or (w4 and not y1);
      z3 := (y1 and w5) or (w3 and not y1);
      z2 := (y1 and w4) or (w2 and not y1);
      z1 := (y1 and w3) or (w1 and not y1);
      z0 := (y1 and w2) or (w0 and not y1);

-- 1 unit shift
      s7 <= (y0 and '0') or (z7 and not y0);
      s6 <= (y0 and z7) or (z6 and not y0);
      s5 <= (y0 and z6) or (z5 and not y0);
      s4 <= (y0 and z5) or (z4 and not y0);
      s3 <= (y0 and z4) or (z3 and not y0);
      s2 <= (y0 and z3) or (z2 and not y0);
      s1 <= (y0 and z2) or (z1 and not y0);
      s0 <= (y0 and z1) or (z0 and not y0);
elsif op1='1' and op0='1' then

w7 := (y2 and x3) or (x7 and not y2);
      w6 := (y2 and x2) or (x6 and not y2);
      w5 := (y2 and x1) or (x5 and not y2);
      w4 := (y2 and x0) or (x4 and not y2);
      w3 := (y2 and '0') or (x3 and not y2);
      w2 := (y2 and '0') or (x2 and not y2);
      w1 := (y2 and '0') or (x1 and not y2);
      w0 := (y2 and '0') or (x0 and not y2);

-- 2 unit shift
      z7 := (y1 and w5) or (w7 and not y1);
      z6 := (y1 and w4) or (w6 and not y1);
      z5 := (y1 and w3) or (w5 and not y1);
      z4 := (y1 and w2) or (w4 and not y1);
      z3 := (y1 and w1) or (w3 and not y1);
      z2 := (y1 and w0) or (w2 and not y1);
      z1 := (y1 and '0') or (w1 and not y1);
      z0 := (y1 and '0') or (w0 and not y1);

-- 1 unit shift
      s7 <= (y0 and z6) or (z7 and not y0);
      s6 <= (y0 and z5) or (z6 and not y0);
      s5 <= (y0 and z4) or (z5 and not y0);
      s4 <= (y0 and z3) or (z4 and not y0);
      s3 <= (y0 and z2) or (z3 and not y0);
      s2 <= (y0 and z1) or (z2 and not y0);
      s1 <= (y0 and z0) or (z1 and not y0);
      s0 <= (y0 and '0') or (z0 and not y0);


end if;
end process;
end Struct;

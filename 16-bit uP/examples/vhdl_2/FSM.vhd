library ieee;
use ieee.std_logic_1164.all;

package MyFsmPack is
  type fsm_state is (s_phi, s_a, s_aa, s_ab, s_aab, s_aba);
  type input_symbol is (reset, a,b);
  type output_symbol is (P,Q);

  component my_fsm is 
     port (X: in input_symbol;
           Y: out output_symbol;
          clk: in std_logic);
  end component;

  function BV_To_Input_Symbol(X: bit_vector)  return input_symbol;
  function BV_To_Output_Symbol(X: bit_vector)  return output_symbol;
end MyFsmPack;

package body MyFsmPack is
  function BV_To_Input_Symbol(X: bit_vector)  return input_symbol  is
     variable ret_var: input_symbol;
  begin
     if(X  = "10")  then
	ret_var := reset;
     elsif (X = "00") then
	ret_var := a;
     else
        ret_var := b;
     end if;
     return(ret_var);
  end BV_To_Input_Symbol;

  function BV_To_Output_Symbol(X: bit_vector)  return output_symbol  is
     variable ret_var: output_symbol;
  begin
     if (X = "1") then
	ret_var := P;
     else
        ret_var := Q;
     end if;
     return(ret_var);
  end BV_To_Output_Symbol;
end package body;

library ieee;
use ieee.std_logic_1164.all;
library work;
use work.MyFsmPack.all;
entity my_fsm is 
  port (X: in input_symbol;
        Y: out output_symbol;
        clk: in std_logic);
end entity my_fsm;

architecture Behave of my_fsm is
  signal state_sig: fsm_state; 
begin
process(X,clk,state_sig)
   variable nstate: fsm_state;
   variable vY: output_symbol;
begin
   -- default values.
   nstate := state_sig;
   vY := Q;

   -- code the next-state and output
   -- functions using sequential code
   -- compute variables nstate, vY
   -- Note that reset condition is not
   -- checked here..
   case state_sig is
     when  s_phi => 
       if(X = a) then
         nstate := s_a;
       end if;
     when s_a =>
       if(X = a) then
         nstate := s_aa;
       elsif (X = b) then
         nstate := s_ab;
       else
         nstate := s_phi;
       end if;
     when s_aa =>
       if(X = b) then
         nstate := s_aab;
       else
         nstate := s_phi;
       end if;
     when s_ab =>
       if(X = a) then
         nstate := s_aba;
       else
         nstate := s_phi;
       end if;
     when s_aab =>
         if(X = b) then
           nstate := s_phi;
           vY := P;
         elsif (X = a) then
           nstate := s_aba;
         else
           nstate := s_phi;
         end if;
     when s_aba =>
         if (X = b) then
           nstate := s_ab;
           vY := P;
         elsif (X=a) then
           nstate := s_aa;
         else
           nstate := s_phi;
         end if;
   end case;          

   -- now apply vY to output signal
   if(X = reset) then
     Y <= Q;
   else
     Y <= vY;
   end if;

   -- apply nstate to state after
   -- delay. Note that the
   -- reset condition is checked
   -- here.
   if(clk'event and clk = '1') then
     if(X = reset) then
       state_sig <= s_phi;
     else
       state_sig <= nstate;
     end if;
   end if;
         
end process;
end Behave;


library work;
use work.MyFsmPack.all;
library std;
use std.textio.all;
library ieee;
use ieee.std_logic_1164.all;

entity Testbench is

end entity;


architecture Behave of Testbench is
  signal X: input_symbol;
  signal Y: output_symbol;
  signal clk: std_logic := '0';
  function to_string(x: string) return string is
      variable ret_val: string(1 to x'length);
      alias lx : string (1 to x'length) is x;
  begin  
      ret_val := lx;
      return(ret_val);
  end to_string;

  function to_std_logic (x: bit) return std_logic is
  begin
	if(x = '1') then return ('1');
	else return('0'); end if;
  end to_std_logic;

begin
  dut: my_fsm port map(X =>X , Y => Y, clk => clk);


  -- rudimentary test..
  -- apply reset,a,a,b,b,a,b
  process
    variable err_flag : boolean := false;
    File INFILE: text open read_mode is "TRACEFILE.txt";
    FILE OUTFILE: text  open write_mode is "OUTPUTS.txt";
    variable input_bv: bit_vector (1 to 2);
    variable output_bv: bit_vector (1 to 1);

    variable INPUT_LINE: Line;
    variable OUTPUT_LINE: Line;
    variable LINE_COUNT: integer := 0;
	
    variable clk_bit: bit;
  begin 
    while not endfile(INFILE) loop 
          -- clock = '0', inputs should be changed here.
          LINE_COUNT := LINE_COUNT + 1;
	  readLine (INFILE, INPUT_LINE);
          read (INPUT_LINE, clk_bit);
          read (INPUT_LINE, input_bv);
          read (INPUT_LINE, output_bv);

          clk <= to_std_logic(clk_bit);
	  X <= BV_To_Input_Symbol(input_bv(1 to 2));

	  wait for 5 ns;

	  -- check Mealy machine output and 
          -- compare with expected.
          if (Y /= BV_To_Output_Symbol(output_bv)) then
             write(OUTPUT_LINE,to_string("ERROR: line "));
             write(OUTPUT_LINE, LINE_COUNT);
             writeline(OUTFILE, OUTPUT_LINE);
             err_flag := true;
          end if; 

	  if(endfile(INFILE)) then
		exit;
	  end if;

	  -- clk = '1', inputs should not change here.
          LINE_COUNT := LINE_COUNT + 1;
	  readLine (INFILE, INPUT_LINE);
          read (INPUT_LINE, clk_bit);
          read (INPUT_LINE, input_bv);
          read (INPUT_LINE, output_bv);
          clk <= to_std_logic(clk_bit);
	  X <= BV_To_Input_Symbol(input_bv(1 to 2));

	  wait for 5 ns;
	  
        end loop;
    
	assert (err_flag) report "SUCCESS, all tests passed." severity note;
    	assert (not err_flag) report "FAILURE, some tests failed." severity error;
	
	wait;
  end process;
  
end Behave;

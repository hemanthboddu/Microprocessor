library ieee;
use ieee.std_logic_1164.all;
library std;
use std.textio.all;

entity Testbench is
end entity;
architecture Behave of Testbench is
  component alu is
    port(x2,x3,x4,x5,x6,x7,x1,x0,y1,y0,y2,y3,y4,y5,y6,y7,op1,op0: in bit;
        s1,s0,s2,s3,s4,s5,s6,s7: out bit);
  end component;

  signal x2,x3,x4,x5,x6,x7,x1,x0,y1,y0,y2,y3,y4,y5,y6,y7,op1,op0,s1,s0,s2,s3,s4,s5,s6,s7: bit := '0';

  function to_std_logic(x: bit) return bit is
      variable ret_val: bit;
  begin  
      if (x = '1') then
        ret_val := '1';
      else 
        ret_val := '0';
      end if;
      return(ret_val);
  end to_std_logic;

  function to_string(x: string) return string is
      variable ret_val: string(1 to x'length);
      alias lx : string (1 to x'length) is x;
  begin  
      ret_val := lx;
      return(ret_val);
  end to_string;

begin
  process 
    variable err_flag : boolean := false;
    File INFILE: text open read_mode is "TRACEFILE.txt";
    FILE OUTFILE: text  open write_mode is "OUTPUTS.txt";

    ---------------------------------------------------
    -- edit the next two lines to customize
    variable input_vector: bit_vector ( 17 downto 0);
    variable output_vector: bit_vector ( 7 downto 0);
    ----------------------------------------------------
    variable INPUT_LINE: Line;
    variable OUTPUT_LINE: Line;
    variable LINE_COUNT: integer := 0;
    
  begin
   
    while not endfile(INFILE) loop 
          LINE_COUNT := LINE_COUNT + 1;
	
	  readLine (INFILE, INPUT_LINE);
          read (INPUT_LINE, input_vector);
          read (INPUT_LINE, output_vector);

          --------------------------------------
          -- from input-vector to DUT inputs
    op1 <= to_std_logic(input_vector(17));
    op0 <= to_std_logic(input_vector(16));
    x7 <= to_std_logic(input_vector(15));
    x6 <= to_std_logic(input_vector(14)); 
    x5 <= to_std_logic(input_vector(13));
    x4 <= to_std_logic(input_vector(12));
    x3 <= to_std_logic(input_vector(11));
    x2 <= to_std_logic(input_vector(10));
	  x1 <= to_std_logic(input_vector(9));
	  x0 <= to_std_logic(input_vector(8));
    y7 <= to_std_logic(input_vector(7));
    y6 <= to_std_logic(input_vector(6));
    y5 <= to_std_logic(input_vector(5));
    y4 <= to_std_logic(input_vector(4));
    y3 <= to_std_logic(input_vector(3));
    y2 <= to_std_logic(input_vector(2));
	  y1 <= to_std_logic(input_vector(1));
	  y0 <= to_std_logic(input_vector(0));
          --------------------------------------


	  -- let circuit respond.
          wait for 5 ns;

          --------------------------------------
	  -- check outputs.
	  if (s0 /= to_std_logic(output_vector(0))) then
             write(OUTPUT_LINE,to_string("ERROR: in s0, line "));
             write(OUTPUT_LINE, LINE_COUNT);
             writeline(OUTFILE, OUTPUT_LINE);
             err_flag := true;
          elsif (s1 /= to_std_logic(output_vector(1))) then
             write(OUTPUT_LINE,to_string("ERROR: in s1, line "));
             write(OUTPUT_LINE, LINE_COUNT);
             writeline(OUTFILE, OUTPUT_LINE);
             err_flag := true;
          elsif (s2 /= to_std_logic(output_vector(2))) then
             write(OUTPUT_LINE,to_string("ERROR: in s2, line "));
             write(OUTPUT_LINE, LINE_COUNT);
             writeline(OUTFILE, OUTPUT_LINE);
             err_flag := true;
          elsif (s3 /= to_std_logic(output_vector(3))) then
             write(OUTPUT_LINE,to_string("ERROR: in s3, line "));
             write(OUTPUT_LINE, LINE_COUNT);
             writeline(OUTFILE, OUTPUT_LINE);
             err_flag := true;
          elsif (s4 /= to_std_logic(output_vector(4))) then
             write(OUTPUT_LINE,to_string("ERROR: in s4, line "));
             write(OUTPUT_LINE, LINE_COUNT);
             writeline(OUTFILE, OUTPUT_LINE);
             err_flag := true;
          elsif (s5 /= to_std_logic(output_vector(5))) then
             write(OUTPUT_LINE,to_string("ERROR: in s5, line "));
             write(OUTPUT_LINE, LINE_COUNT);
             writeline(OUTFILE, OUTPUT_LINE);
             err_flag := true;
          elsif (s6 /= to_std_logic(output_vector(6))) then
             write(OUTPUT_LINE,to_string("ERROR: in s6, line "));
             write(OUTPUT_LINE, LINE_COUNT);
             writeline(OUTFILE, OUTPUT_LINE);
             err_flag := true;
          elsif (s7 /= to_std_logic(output_vector(7))) then
             write(OUTPUT_LINE,to_string("ERROR: in s7, line "));
             write(OUTPUT_LINE, LINE_COUNT);
             writeline(OUTFILE, OUTPUT_LINE);
             err_flag := true;            
          end if;
          --------------------------------------
    end loop;

    assert (err_flag) report "SUCCESS, all tests passed." severity note;
    assert (not err_flag) report "FAILURE, some tests failed." severity error;

    wait;
  end process;

  dut: alu
     port map(op1 => op1,
              op0 => op0,
              x0 => x0,
              x1 => x1,
              x2 => x2,
              x3 => x3,
              x4 => x4,
              x5 => x5,
              x6 => x6,
              x7 => x7,
              y0 => y0,
              y1 => y1,
              y2 => y2,
              y3 => y3,
              y4 => y4,
              y5 => y5,
              y6 => y6,
              y7 => y7,
              s0 => s0,
              s1 => s1,
              s2 => s2,
              s3 => s3,
              s4 => s4,
              s5 => s5,
              s6 => s6,
              s7 => s7);

end Behave;

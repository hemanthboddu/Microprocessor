library ieee;
use ieee.std_logic_1164.all;
library std;
use std.textio.all;

entity Testbench is
end entity;
architecture Behave of Testbench is
  component TwoBitAdder is
   port(x1,x0,y1,y0: in std_logic;
        s1,s0: out std_logic);
  end component;

  signal x0,x1,y0,y1,s0,s1: std_logic := '0';

  function to_std_logic(x: bit) return std_logic is
      variable ret_val: std_logic;
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
    variable input_vector: bit_vector ( 3 downto 0);
    variable output_vector: bit_vector ( 1 downto 0);
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
	  x1 <= to_std_logic(input_vector(3));
	  x0 <= to_std_logic(input_vector(2));
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
          end if;
          --------------------------------------
    end loop;

    assert (err_flag) report "SUCCESS, all tests passed." severity note;
    assert (not err_flag) report "FAILURE, some tests failed." severity error;

    wait;
  end process;

  dut: TwoBitAdder 
     port map(x0 => x0,
              x1 => x1,
              y0 => y0,
              y1 => y1,
              s0 => s0,
              s1 => s1);

end Behave;

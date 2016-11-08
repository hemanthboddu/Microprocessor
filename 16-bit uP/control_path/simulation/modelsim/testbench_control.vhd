library ieee;
use ieee.std_logic_1164.all;
library std;
use std.textio.all;

entity testbench_control is
end entity;
architecture Behave of testbench_control is
component control_path is
port(
	clock: in std_logic;
	reset : in std_logic;

	-------------------------------------------------------
	---Control Signals
	pcWrite : out std_logic;
	rfWrite : out std_logic;
	irWrite : out std_logic;
	memRead : out std_logic;
	memWrite : out std_logic;
	alu_op : out std_logic_vector(1 downto 0);
	--------------------------------------------------------
	---MUX Signals
	mux_mem_data : out std_logic;
	mux_mem_addr : out std_logic_vector(1 downto 0);
	mux_a3 : out std_logic;
	mux_a2 : out std_logic;
	mux_a1 : out std_logic_vector(1 downto 0);
	mux_a : out std_logic;
	mux_b : out std_logic_vector(1 downto 0);
	mux_d3 : out std_logic_vector(1 downto 0);
	mux_pc : out std_logic_vector(1 downto 0);
	mux_pe_tmp : out std_logic;
	mux_before_a : out std_logic;
	--------------------------------------------------------------------------
	------Enable pins
	enable_alu : out std_logic;
	enable_a : out std_logic;
	enable_b : out std_logic;
	enable_c : out std_logic;
	enable_mdr : out std_logic;
	enable_pe_tmp : out std_logic;
	enable_pe_out : out std_logic;
	enable_pe_flag : out std_logic;
	enable_eqflag : out std_logic;
--	enable_pe3 : out std_logic;
	enable_carry_flag : out std_logic;
	enable_Z_flag : out std_logic;
	enable_pe : out std_logic;
	enable_pe_1_3 : out std_logic;	
	se_6_16 : out std_logic;
	se_9_16 : out std_logic;
	ze_9_16 : out std_logic;
	--------------------------------------------------------------------
	
	carry : in std_logic;
	Z : in std_logic;
	eqflag :in std_logic;
	pe_flag :in std_logic;
--	instruction : in bit_vector(15 downto 0);
--	op_15 : in bit;
--	op_14_13 : in bit_vector(1 downto 0);
	op_code : in std_logic_vector(3 downto 0);
	CZ : in std_logic_vector(1 downto 0)
	
	);
end component;

  signal clock: std_logic:='0';
  signal reset : std_logic:='0';

  -------------------------------------------------------
  ---Control Signals
  signal pcWrite : std_logic := '0';
  signal  rfWrite :  std_logic:= '0';
  signal  irWrite :  std_logic:= '0';
  signal  memRead :  std_logic:= '0';
  signal  memWrite :  std_logic:= '0';
  signal alu_op :  std_logic_vector(1 downto 0):= "00";
  --------------------------------------------------------
  ---MUX Signals
  signal  mux_mem_data :  std_logic:= '0';
  signal  mux_mem_addr :  std_logic_vector(1 downto 0):= "00";
  signal  mux_a3 :  std_logic:= '0';
  signal  mux_a2 :  std_logic:= '0';
  signal  mux_a1 :  std_logic_vector(1 downto 0):= "00";
  signal  mux_a :  std_logic:= '0';
  signal  mux_b :  std_logic_vector(1 downto 0):= "00";
  signal  mux_d3 :  std_logic_vector(1 downto 0):= "00";
  signal  mux_pc :  std_logic_vector(1 downto 0):= "00";
  signal  mux_pe_tmp :  std_logic:= '0';
  signal mux_before_a :  std_logic:= '0';
  --------------------------------------------------------------------------
  ------Enable pins
  signal  enable_alu :  std_logic:= '0';
  signal  enable_a :  std_logic:= '0';
  signal  enable_b :  std_logic:= '0';
  signal  enable_c :  std_logic:= '0';
  signal  enable_mdr :  std_logic:= '0';
  signal  enable_pe_tmp :  std_logic:= '0';
  signal  enable_pe_out :  std_logic:= '0';
  signal  enable_pe_flag :  std_logic:= '0';
  signal  enable_eqflag :  std_logic:= '0';
--  enable_pe3 : out std_logic;
  signal  enable_carry_flag :  std_logic:= '0';
  signal  enable_Z_flag :  std_logic:= '0';
  signal enable_pe :  std_logic:= '0';
  signal  enable_pe_1_3 :  std_logic:= '0';  
  signal se_6_16 :  std_logic:= '0';
  signal  se_9_16 :  std_logic:= '0';
  signal  ze_9_16 :  std_logic:= '0';
  --------------------------------------------------------------------
  
  signal  carry :  std_logic:= '0';
  signal  Z :  std_logic:= '0';
  signal  eqflag : std_logic:= '0';
  signal  pe_flag : std_logic:= '0';
--  instruction : in bit_vector(15 downto 0);
--  op_15 : in bit;
--  op_14_13 : in bit_vector(1 downto 0);
  signal  op_code :  std_logic_vector(3 downto 0):= "0000";
  signal  CZ :  std_logic_vector(1 downto 0):= "00";
  
  
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
    File INFILE: text open read_mode is "tracefile_controlpath.txt";
    FILE OUTFILE: text  open write_mode is "OUTPUTS.txt";

    ---------------------------------------------------
    -- edit the next two lines to customize
    variable input_vector: bit_vector ( 11 downto 0);
    --variable input_vector2: bit_vector ( 15 downto 0);
    variable output_vector: bit_vector (38 downto 0);
    ----------------------------------------------------
    variable INPUT_LINE: Line;
    variable OUTPUT_LINE: Line;
    variable LINE_COUNT: integer := 0;
    
  begin
   
    while not endfile(INFILE) loop 
          LINE_COUNT := LINE_COUNT + 1;
	
	  readLine (INFILE, INPUT_LINE);
          read (INPUT_LINE, input_vector);
          --read (INPUT_LINE, input_vector2);
          read (INPUT_LINE, output_vector);

          --------------------------------------
          -- from input-vector to DUT inputs
  clock <= to_std_logic(input_vector(11));
  reset <= to_std_logic(input_vector(10));
  --------------------------------------------------------------------
  
  carry <= to_std_logic(input_vector(9));
  Z <= to_std_logic(input_vector(8));
  eqflag <= to_std_logic(input_vector(7));
  pe_flag <= to_std_logic(input_vector(6));
--  instruction : in bit_vector(15 downto 0);
--  op_15 : in bit;
--  op_14_13 : in bit_vector(1 downto 0);
  op_code <= to_stdlogicvector(input_vector(5 downto 2));
  CZ <= to_stdlogicvector(input_vector(1 downto 0));
	  --y <= to_stdlogicvector(input_vector2);
          --------------------------------------


	  -- let circuit respond.
          wait for 5 ns;

          --------------------------------------
	  -- check outputs.
	 if (pcWrite /= to_std_logic(output_vector(38))) then
      write(OUTPUT_LINE,to_string("ERROR: in s0-pcw, line "));
      write(OUTPUT_LINE, LINE_COUNT);
      writeline(OUTFILE, OUTPUT_LINE); 
      err_flag := true;
    end if;
    if (rfWrite /= to_std_logic(output_vector(37))) then
      write(OUTPUT_LINE,to_string("ERROR: in s0-rfw, line "));
      write(OUTPUT_LINE, LINE_COUNT);
      writeline(OUTFILE, OUTPUT_LINE); 
      err_flag := true;
    end if;
    if (irWrite /= to_std_logic(output_vector(36))) then
      write(OUTPUT_LINE,to_string("ERROR: in s0-irw, line "));
      write(OUTPUT_LINE, LINE_COUNT);
      writeline(OUTFILE, OUTPUT_LINE); 
      err_flag := true;
    end if;
    if (memRead /= to_std_logic(output_vector(35))) then
      write(OUTPUT_LINE,to_string("ERROR: in s0-memre, line "));
      write(OUTPUT_LINE, LINE_COUNT);
      writeline(OUTFILE, OUTPUT_LINE); 
      err_flag := true;
    end if;
    if (memWrite /= to_std_logic(output_vector(34))) then
      write(OUTPUT_LINE,to_string("ERROR: in s0-memwr, line "));
      write(OUTPUT_LINE, LINE_COUNT);
      writeline(OUTFILE, OUTPUT_LINE); 
      err_flag := true;
    end if;
    if (alu_op /= to_stdlogicvector(output_vector(33 downto 32))) then
      write(OUTPUT_LINE,to_string("ERROR: in s0-aluop, line "));
      write(OUTPUT_LINE, LINE_COUNT);
      writeline(OUTFILE, OUTPUT_LINE); 
      err_flag := true;
    end if;
    if (mux_mem_data /= to_std_logic(output_vector(31))) then
      write(OUTPUT_LINE,to_string("ERROR: in s0-muxmemda, line "));
      write(OUTPUT_LINE, LINE_COUNT);
      writeline(OUTFILE, OUTPUT_LINE); 
      err_flag := true;
    end if;
    if (mux_mem_addr /= to_stdlogicvector(output_vector(30 downto 29))) then
      write(OUTPUT_LINE,to_string("ERROR: in s0-muxmemadd, line "));
      write(OUTPUT_LINE, LINE_COUNT);
      writeline(OUTFILE, OUTPUT_LINE); 
      err_flag := true;
    end if;
    if (mux_a3 /= to_std_logic(output_vector(28))) then
      write(OUTPUT_LINE,to_string("ERROR: in s0-muxa3, line "));
      write(OUTPUT_LINE, LINE_COUNT);
      writeline(OUTFILE, OUTPUT_LINE); 
      err_flag := true;
    end if;
    if (mux_a2 /= to_std_logic(output_vector(27))) then
      write(OUTPUT_LINE,to_string("ERROR: in s0-muxa2, line "));
      write(OUTPUT_LINE, LINE_COUNT);
      writeline(OUTFILE, OUTPUT_LINE); 
      err_flag := true;
    end if;
    if (mux_a1 /= to_stdlogicvector(output_vector(26 downto 25))) then
      write(OUTPUT_LINE,to_string("ERROR: in s0-muxa1, line "));
      write(OUTPUT_LINE, LINE_COUNT);
      writeline(OUTFILE, OUTPUT_LINE); 
      err_flag := true;
    end if;
    if (mux_a /= to_std_logic(output_vector(24))) then
      write(OUTPUT_LINE,to_string("ERROR: in s0-muxa, line "));
      write(OUTPUT_LINE, LINE_COUNT);
      writeline(OUTFILE, OUTPUT_LINE); 
      err_flag := true;
    end if;
    if (mux_b /= to_stdlogicvector(output_vector(23 downto 22))) then
      write(OUTPUT_LINE,to_string("ERROR: in s0-muxb, line "));
      write(OUTPUT_LINE, LINE_COUNT);
      writeline(OUTFILE, OUTPUT_LINE); 
      err_flag := true;
    end if;
    if (mux_d3 /= to_stdlogicvector(output_vector(21 downto 20))) then
      write(OUTPUT_LINE,to_string("ERROR: in s0-muxd3, line "));
      write(OUTPUT_LINE, LINE_COUNT);
      writeline(OUTFILE, OUTPUT_LINE); 
      err_flag := true;
    end if;
    if (mux_pc /= to_stdlogicvector(output_vector(19 downto 18))) then
      write(OUTPUT_LINE,to_string("ERROR: in s0-muxpc, line "));
      write(OUTPUT_LINE, LINE_COUNT);
      writeline(OUTFILE, OUTPUT_LINE); 
      err_flag := true;
    end if;
    if (mux_pe_tmp /= to_std_logic(output_vector(17))) then
      write(OUTPUT_LINE,to_string("ERROR: in s0-muxpetmp, line "));
      write(OUTPUT_LINE, LINE_COUNT);
      writeline(OUTFILE, OUTPUT_LINE); 
      err_flag := true;
    end if;
    if (mux_before_a /= to_std_logic(output_vector(16))) then
      write(OUTPUT_LINE,to_string("ERROR: in s0-muxbefa, line "));
      write(OUTPUT_LINE, LINE_COUNT);
      writeline(OUTFILE, OUTPUT_LINE); 
      err_flag := true;
    end if;
    if (enable_alu /= to_std_logic(output_vector(15))) then
      write(OUTPUT_LINE,to_string("ERROR: in s0-enalu, line "));
      write(OUTPUT_LINE, LINE_COUNT);
      writeline(OUTFILE, OUTPUT_LINE); 
      err_flag := true;
    end if;
    if (enable_a /= to_std_logic(output_vector(14))) then
      write(OUTPUT_LINE,to_string("ERROR: in s0-ena, line "));
      write(OUTPUT_LINE, LINE_COUNT);
      writeline(OUTFILE, OUTPUT_LINE); 
      err_flag := true;
    end if;
    if (enable_b /= to_std_logic(output_vector(13))) then
      write(OUTPUT_LINE,to_string("ERROR: in s0-enb, line "));
      write(OUTPUT_LINE, LINE_COUNT);
      writeline(OUTFILE, OUTPUT_LINE); 
      err_flag := true;
    end if;
    if (enable_c /= to_std_logic(output_vector(12))) then
      write(OUTPUT_LINE,to_string("ERROR: in s0-enc, line "));
      write(OUTPUT_LINE, LINE_COUNT);
      writeline(OUTFILE, OUTPUT_LINE); 
      err_flag := true;
    end if;
    if (enable_mdr /= to_std_logic(output_vector(11))) then
      write(OUTPUT_LINE,to_string("ERROR: in s0-enmdr, line "));
      write(OUTPUT_LINE, LINE_COUNT);
      writeline(OUTFILE, OUTPUT_LINE); 
      err_flag := true;
    end if;
    if (enable_pe_tmp /= to_std_logic(output_vector(10))) then
      write(OUTPUT_LINE,to_string("ERROR: in s0-enpetmp, line "));
      write(OUTPUT_LINE, LINE_COUNT);
      writeline(OUTFILE, OUTPUT_LINE); 
      err_flag := true;
    end if;
    if (enable_pe_out /= to_std_logic(output_vector(9))) then
      write(OUTPUT_LINE,to_string("ERROR: in s0-enpeout, line "));
      write(OUTPUT_LINE, LINE_COUNT);
      writeline(OUTFILE, OUTPUT_LINE); 
      err_flag := true;
    end if;
    if (enable_pe_flag /= to_std_logic(output_vector(8))) then
      write(OUTPUT_LINE,to_string("ERROR: in s0-enpeflag, line "));
      write(OUTPUT_LINE, LINE_COUNT);
      writeline(OUTFILE, OUTPUT_LINE); 
      err_flag := true;
    end if;
    if (enable_eqflag /= to_std_logic(output_vector(7))) then
      write(OUTPUT_LINE,to_string("ERROR: in s0-eneq, line "));
      write(OUTPUT_LINE, LINE_COUNT);
      writeline(OUTFILE, OUTPUT_LINE); 
      err_flag := true;
    end if;
    if (enable_carry_flag /= to_std_logic(output_vector(6))) then
      write(OUTPUT_LINE,to_string("ERROR: in s0-encflag, line "));
      write(OUTPUT_LINE, LINE_COUNT);
      writeline(OUTFILE, OUTPUT_LINE); 
      err_flag := true;
    end if;
    if (enable_Z_flag /= to_std_logic(output_vector(5))) then
      write(OUTPUT_LINE,to_string("ERROR: in s0-enzflag, line "));
      write(OUTPUT_LINE, LINE_COUNT);
      writeline(OUTFILE, OUTPUT_LINE); 
      err_flag := true;
    end if;
    if (enable_pe /= to_std_logic(output_vector(4))) then
      write(OUTPUT_LINE,to_string("ERROR: in s0-enpe, line "));
      write(OUTPUT_LINE, LINE_COUNT);
      writeline(OUTFILE, OUTPUT_LINE); 
      err_flag := true;
    end if;
    if (enable_pe_1_3 /= to_std_logic(output_vector(3))) then
      write(OUTPUT_LINE,to_string("ERROR: in s0-enpe13, line "));
      write(OUTPUT_LINE, LINE_COUNT);
      writeline(OUTFILE, OUTPUT_LINE); 
      err_flag := true;
    end if;
    if (se_6_16 /= to_std_logic(output_vector(2))) then
      write(OUTPUT_LINE,to_string("ERROR: in s0-se616, line "));
      write(OUTPUT_LINE, LINE_COUNT);
      writeline(OUTFILE, OUTPUT_LINE); 
      err_flag := true;
    end if;
    if (se_9_16 /= to_std_logic(output_vector(1))) then
      write(OUTPUT_LINE,to_string("ERROR: in s0-se916, line "));
      write(OUTPUT_LINE, LINE_COUNT);
      writeline(OUTFILE, OUTPUT_LINE); 
      err_flag := true;
    end if;
    if (ze_9_16 /= to_std_logic(output_vector(0))) then
      write(OUTPUT_LINE,to_string("ERROR: in s0-ze, line "));
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

  dut: control_path
     port map(
  clock,
  reset,

  -------------------------------------------------------
  ---Control Signals
  pcWrite ,
  rfWrite ,
  irWrite , 
  memRead , 
  memWrite , 
  alu_op , 
  --------------------------------------------------------
  ---MUX Signals
  mux_mem_data ,
  mux_mem_addr ,
  mux_a3 ,
  mux_a2 ,
  mux_a1 ,
  mux_a ,
  mux_b ,
  mux_d3,
  mux_pc,
  mux_pe_tmp ,
  mux_before_a, 
  --------------------------------------------------------------------------
  ------Enable pins
  enable_alu ,
  enable_a ,
  enable_b ,
  enable_c ,
  enable_mdr, 
  enable_pe_tmp ,
  enable_pe_out ,
  enable_pe_flag ,
  enable_eqflag ,
--  enable_pe3 : out std_logic;
  enable_carry_flag, 
  enable_Z_flag ,
  enable_pe ,
  enable_pe_1_3 , 
  se_6_16 ,
  se_9_16 ,
  ze_9_16 ,
  --------------------------------------------------------------------
  
  carry ,
  Z ,
  eqflag ,
  pe_flag ,
--  instruction : in bit_vector(15 downto 0);
--  op_15 : in bit;
--  op_14_13 : in bit_vector(1 downto 0);
  op_code ,
  CZ 
   );

end Behave;

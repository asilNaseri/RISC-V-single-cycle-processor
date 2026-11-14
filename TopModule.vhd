library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity TopModule is
port ( clk    : in  std_logic);
end TopModule;

architecture behavioral of TopModule is


component ALU is 
port( Data_A : in std_logic_vector(32-1 downto 0);
      Data_B : in std_logic_vector(32-1 downto 0);
	  ALUSel : in std_logic_vector(2-1 downto 0);
	  Data_D : out std_logic_vector(32-1 downto 0)
    );
end  component;

component IMM_GEN is
port( input : in signed(12-1 downto 0);
      output : out signed(32-1 downto 0)
    );
end component;

component RegisterFile is 
port( clk    : in  std_logic;
      Addr_A : in  std_logic_vector(5-1 downto 0);
	  Addr_B : in  std_logic_vector(5-1 downto 0);
	  Addr_D : in  std_logic_vector(5-1 downto 0);
	  Data_D : in  std_logic_vector(32-1 downto 0);
	  RegWEn : in  std_logic;
	  Data_A : out std_logic_vector(32-1 downto 0);
	  Data_B : out std_logic_vector(32-1 downto 0));
end component;

component Instruction_MEM is 
port ( input_ADDR : in  std_logic_vector(6-1 downto 0);
       inst0      : out std_logic_vector(8-1 downto 0);
	   inst1      : out std_logic_vector(8-1 downto 0);
	   inst2      : out std_logic_vector(8-1 downto 0);
	   inst3      : out std_logic_vector(8-1 downto 0));
end component;

component PC is 
port( clk          : in  std_logic;
      current_inst : out  std_logic_vector(6-1 downto 0));
end component;

component control_unit is
port( instruction : in std_logic_vector(32-1 downto 0);
      RegWEn      : out std_logic;
      ImmSel      : out std_logic;
      BSel        : out std_logic;
      ALUSel      : out std_logic_vector(2-1 downto 0));
end component;


signal opcode : std_logic_vector(7-1 downto 0);
signal formatDetector : std_logic_vector(32-1 downto 0);

signal Data_A : std_logic_vector(32-1 downto 0);
signal Data_B : std_logic_vector(32-1 downto 0);
signal output : std_logic_vector(32-1 downto 0);
signal Data_D : std_logic_vector(32-1 downto 0);


signal BSel : std_logic;
signal ALUSel : std_logic_vector(2-1 downto 0);
signal ImmSel : std_logic;
signal RegWEn : std_logic;
signal instruction : std_logic_vector(32-1 downto 0);


signal PC_OutPut : std_logic_vector(6-1 downto 0);

begin

opcode <= instruction(6 downto 0);
formatDetector <= output when BSel='1' else Data_B;


    ALU_inst : ALU
    port map (
        Data_A => Data_A,
        Data_B => formatDetector,
        ALUSel => ALUSel,
        Data_D => Data_D
    );

    IMM_GEN_inst : IMM_GEN
    port map (
        input  => signed(instruction(31 downto 20)),
        std_logic_vector(output) => output
    );

    RegFile_inst : RegisterFile
    port map (
        clk    => clk,
        Addr_A => instruction(19 downto 15),
        Addr_B => instruction(24 downto 20),
        Addr_D => instruction(11 downto 7),
        Data_D => Data_D,
        RegWEn => RegWEn,
        Data_A => Data_A,
        Data_B => Data_B
    );

    InstrMem_inst : Instruction_MEM
    port map (
        input_ADDR => PC_OutPut,
        inst3      => instruction(8-1 downto 0),
        inst2      => instruction(16-1 downto 8),
        inst1      => instruction(24-1 downto 16),
        inst0      => instruction(32-1 downto 24)
    );

    PC_inst : PC
    port map (
        clk          => clk,
        current_inst => PC_OutPut
    );

    Control_inst : control_unit
    port map (
        instruction => instruction,
        RegWEn      => RegWEn,
        ImmSel      => ImmSel,
        BSel        => BSel,
        ALUSel      => ALUSel
    );



end behavioral;


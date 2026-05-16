library verilog;
use verilog.vl_types.all;
entity picorv32_pcpi_mul is
    generic(
        STEPS_AT_ONCE   : integer := 1;
        CARRY_CHAIN     : integer := 4
    );
    port(
        clk             : in     vl_logic;
        resetn          : in     vl_logic;
        pcpi_valid      : in     vl_logic;
        pcpi_insn       : in     vl_logic_vector(31 downto 0);
        pcpi_rs1        : in     vl_logic_vector(31 downto 0);
        pcpi_rs2        : in     vl_logic_vector(31 downto 0);
        pcpi_wr         : out    vl_logic;
        pcpi_rd         : out    vl_logic_vector(31 downto 0);
        pcpi_wait       : out    vl_logic;
        pcpi_ready      : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of STEPS_AT_ONCE : constant is 1;
    attribute mti_svvh_generic_type of CARRY_CHAIN : constant is 1;
end picorv32_pcpi_mul;

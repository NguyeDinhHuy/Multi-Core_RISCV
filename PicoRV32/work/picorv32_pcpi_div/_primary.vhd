library verilog;
use verilog.vl_types.all;
entity picorv32_pcpi_div is
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
end picorv32_pcpi_div;

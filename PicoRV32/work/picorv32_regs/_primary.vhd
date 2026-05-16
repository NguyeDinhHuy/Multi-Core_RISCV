library verilog;
use verilog.vl_types.all;
entity picorv32_regs is
    port(
        clk             : in     vl_logic;
        wen             : in     vl_logic;
        waddr           : in     vl_logic_vector(5 downto 0);
        raddr1          : in     vl_logic_vector(5 downto 0);
        raddr2          : in     vl_logic_vector(5 downto 0);
        wdata           : in     vl_logic_vector(31 downto 0);
        rdata1          : out    vl_logic_vector(31 downto 0);
        rdata2          : out    vl_logic_vector(31 downto 0)
    );
end picorv32_regs;

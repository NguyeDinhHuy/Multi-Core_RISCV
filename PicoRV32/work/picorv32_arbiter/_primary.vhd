library verilog;
use verilog.vl_types.all;
entity picorv32_arbiter is
    port(
        clk             : in     vl_logic;
        resetn          : in     vl_logic;
        m0_valid        : in     vl_logic;
        m0_addr         : in     vl_logic_vector(31 downto 0);
        m0_wdata        : in     vl_logic_vector(31 downto 0);
        m0_wstrb        : in     vl_logic_vector(3 downto 0);
        m0_ready        : out    vl_logic;
        m1_valid        : in     vl_logic;
        m1_addr         : in     vl_logic_vector(31 downto 0);
        m1_wdata        : in     vl_logic_vector(31 downto 0);
        m1_wstrb        : in     vl_logic_vector(3 downto 0);
        m1_ready        : out    vl_logic;
        s_valid         : out    vl_logic;
        s_addr          : out    vl_logic_vector(31 downto 0);
        s_wdata         : out    vl_logic_vector(31 downto 0);
        s_wstrb         : out    vl_logic_vector(3 downto 0);
        s_ready         : in     vl_logic
    );
end picorv32_arbiter;

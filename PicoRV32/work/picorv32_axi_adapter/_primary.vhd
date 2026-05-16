library verilog;
use verilog.vl_types.all;
entity picorv32_axi_adapter is
    port(
        clk             : in     vl_logic;
        resetn          : in     vl_logic;
        mem_axi_awvalid : out    vl_logic;
        mem_axi_awready : in     vl_logic;
        mem_axi_awaddr  : out    vl_logic_vector(31 downto 0);
        mem_axi_awprot  : out    vl_logic_vector(2 downto 0);
        mem_axi_wvalid  : out    vl_logic;
        mem_axi_wready  : in     vl_logic;
        mem_axi_wdata   : out    vl_logic_vector(31 downto 0);
        mem_axi_wstrb   : out    vl_logic_vector(3 downto 0);
        mem_axi_bvalid  : in     vl_logic;
        mem_axi_bready  : out    vl_logic;
        mem_axi_arvalid : out    vl_logic;
        mem_axi_arready : in     vl_logic;
        mem_axi_araddr  : out    vl_logic_vector(31 downto 0);
        mem_axi_arprot  : out    vl_logic_vector(2 downto 0);
        mem_axi_rvalid  : in     vl_logic;
        mem_axi_rready  : out    vl_logic;
        mem_axi_rdata   : in     vl_logic_vector(31 downto 0);
        mem_valid       : in     vl_logic;
        mem_instr       : in     vl_logic;
        mem_ready       : out    vl_logic;
        mem_addr        : in     vl_logic_vector(31 downto 0);
        mem_wdata       : in     vl_logic_vector(31 downto 0);
        mem_wstrb       : in     vl_logic_vector(3 downto 0);
        mem_rdata       : out    vl_logic_vector(31 downto 0)
    );
end picorv32_axi_adapter;

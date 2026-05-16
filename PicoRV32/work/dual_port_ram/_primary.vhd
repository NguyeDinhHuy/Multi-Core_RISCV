library verilog;
use verilog.vl_types.all;
entity dual_port_ram is
    generic(
        ADDR_WIDTH      : integer := 12;
        INIT_FILE       : string  := ""
    );
    port(
        clk             : in     vl_logic;
        addr_a          : in     vl_logic_vector;
        din_a           : in     vl_logic_vector(31 downto 0);
        we_a            : in     vl_logic_vector(3 downto 0);
        dout_a          : out    vl_logic_vector(31 downto 0);
        addr_b          : in     vl_logic_vector;
        din_b           : in     vl_logic_vector(31 downto 0);
        we_b            : in     vl_logic_vector(3 downto 0);
        dout_b          : out    vl_logic_vector(31 downto 0)
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of ADDR_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of INIT_FILE : constant is 1;
end dual_port_ram;

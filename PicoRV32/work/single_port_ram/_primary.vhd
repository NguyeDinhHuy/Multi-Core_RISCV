library verilog;
use verilog.vl_types.all;
entity single_port_ram is
    generic(
        ADDR_WIDTH      : integer := 12;
        INIT_FILE       : string  := "program.hex"
    );
    port(
        clk             : in     vl_logic;
        addr            : in     vl_logic_vector;
        din             : in     vl_logic_vector(31 downto 0);
        we              : in     vl_logic_vector(3 downto 0);
        dout            : out    vl_logic_vector(31 downto 0);
        ready           : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of ADDR_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of INIT_FILE : constant is 1;
end single_port_ram;

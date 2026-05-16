library verilog;
use verilog.vl_types.all;
entity dual_core is
    port(
        clk             : in     vl_logic;
        resetn          : in     vl_logic;
        trap_0          : out    vl_logic;
        trap_1          : out    vl_logic
    );
end dual_core;

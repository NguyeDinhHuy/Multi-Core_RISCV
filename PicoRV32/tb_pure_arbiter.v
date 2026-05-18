`timescale 1ns / 1ps

module tb_pure_arbiter;
    // --- Khai báo các tín hi?u ?i?u khi?n c?a Testbench ---
    reg clk;
    reg resetn;
    
    // ???ng dây gi? l?p Core 0 (Master 0)
    reg         m0_valid;
    reg  [31:0] m0_addr;
    reg  [31:0] m0_wdata;
    reg  [3:0]  m0_wstrb;
    wire        m0_ready;
    
    // ???ng dây gi? l?p Core 1 (Master 1)
    reg         m1_valid;
    reg  [31:0] m1_addr;
    reg  [31:0] m1_wdata;
    reg  [3:0]  m1_wstrb;
    wire        m1_ready;
    
    // ???ng dây k?t n?i xu?ng RAM (Slave)
    wire        s_valid;
    wire [31:0] s_addr;
    wire [31:0] s_wdata;
    wire [3:0]  s_wstrb;
    reg         s_ready;

    // --- Kh?i t?o kh?i Arbiter c?n ki?m tra (UUT) ---
    picorv32_arbiter uut (
        .clk(clk), .resetn(resetn),
        // C?ng Core 0
        .m0_valid(m0_valid), .m0_addr(m0_addr), .m0_wdata(m0_wdata), .m0_wstrb(m0_wstrb), .m0_ready(m0_ready),
        // C?ng Core 1
        .m1_valid(m1_valid), .m1_addr(m1_addr), .m1_wdata(m1_wdata), .m1_wstrb(m1_wstrb), .m1_ready(m1_ready),
        // C?ng RAM
        .s_valid(s_valid), .s_addr(s_addr), .s_wdata(s_wdata), .s_wstrb(s_wstrb), .s_ready(s_ready)
    );

    // T?o xung nh?p Clock chu k? 10ns (50MHz)
    always #5 clk = ~clk;

    // --- K?ch b?n th? nghi?m các tr??ng h?p tranh ch?p c?c ?oan ---
    initial begin
        // Kh?i t?o tr?ng thái ban ??u
        clk = 0;
        resetn = 0;
        m0_valid = 0; m0_addr = 0; m0_wdata = 0; m0_wstrb = 0;
        m1_valid = 0; m1_addr = 0; m1_wdata = 0; m1_wstrb = 0;
        s_ready = 1; // Gi? l?p RAM luôn s?n sàng ph?n h?i trong 1 chu k?

        #20;
        resetn = 1; // Thoát reset -> lúc này theo code last_served = 0
        #10;

        // =================================================================
        // K?CH B?N 1: Ch? có m?t mình Core 0 ?òi truy c?p RAM
        // =================================================================
        $display("[TIME: %0t ps] K?CH B?N 1: Chi co Core 0 dung Bus", $time);
        m0_valid = 1; m0_addr = 32'h0000_2000;
        m1_valid = 0;
        #10; // ??i 1 chu k? clock ?? Core 0 chi?m Bus xong
        // K?t qu? sau c?nh lên clock này: last_served c?p nh?t v? 0 vì Core 0 v?a ch?y

        // =================================================================
        // K?CH B?N 2: C? HAI CÙNG TRANH CH?P - CORE 1 PH?I ???C ?U TIÊN!
        // =================================================================
        $display("[TIME: %0t ps] K?CH B?N 2: Ca hai cung valid! Core 1 phai thang vi chu ky truoc Core 0 vua chay.", $time);
        m0_valid = 1; m0_addr = 32'h0000_2000;
        m1_valid = 1; m1_addr = 32'h0000_1000; 
        #10; 
        // Xem trên Waveform t?i chu k? này: B?n s? th?y m1_ready = 1 và m0_ready = 0!
        // K?t qu? sau c?nh lên clock này: last_served l?t lên b?ng 1 vì Core 1 v?a th?ng

        // =================================================================
        // K?CH B?N 3: TI?P T?C TRANH CH?P - L?N NÀY CORE 0 PH?I TH?NG!
        // =================================================================
        $display("[TIME: %0t ps] K?CH B?N 3: Ca hai van valid! Lan nay den luot Core 0 thang.", $time);
        m0_valid = 1; m0_addr = 32'h0000_2000;
        m1_valid = 1; m1_addr = 32'h0000_1000;
        #10;
        // Xem trên Waveform t?i chu k? này: B?n s? th?y m0_ready = 1 và m1_ready = 0!

        // K?t thúc mô ph?ng
        m0_valid = 0; m1_valid = 0;
        #20;
        $display("Mo phong hoan thanh thanh cong!");
        $finish;
    end

endmodule
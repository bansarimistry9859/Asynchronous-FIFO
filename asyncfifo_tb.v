`timescale 1ns/1ps

module asyncfifo_tb;
  //Full Condition

  // Parameters
  parameter DATA_WIDTH = 8;
  parameter DEPTH = 8;

  // Clock signals
  reg wclk = 0;
  reg rclk = 0;
  

  // Reset signals
  reg wrst_n = 0;
  reg rrst_n = 0;

  // FIFO signals
  reg w_en = 0;
  reg r_en = 0;
  reg [DATA_WIDTH-1:0] data_in = 0;
  wire [DATA_WIDTH-1:0] data_out;
  wire full;
  wire empty;

  // Instantiate the FIFO
  asyncfifo uut (
    .wclk(wclk),
    .wrst_n(wrst_n),
    .rclk(rclk),
    .rrst_n(rrst_n),
    .w_en(w_en),
    .r_en(r_en),
    .data_in(data_in),
    .data_out(data_out),
    .full(full),
    .empty(empty)
  );

  // Clock generation
  always #5 wclk = ~wclk;  // 100 MHz write clock
  always #7 rclk = ~rclk;  // ~71 MHz read clock

  initial begin
    // Initialize resets
    wrst_n = 0; rrst_n = 0;
    w_en = 0; r_en = 0;
    data_in = 0;
    #20;
    wrst_n = 1; rrst_n = 1;

    // Start writing until FIFO is full
    @(posedge wclk);
    w_en = 1;

    while (!full) begin
      @(posedge wclk);
      data_in = data_in + 1;  // increment data for simplicity
    end

    

    // Stop simulation
    w_en = 0;
    #20;
    $stop;
  end

endmodule





//Comment the Above Test Bench of Full Conditon (Select the above text -> Edit-> Comment Selection)
//Uncomment the Below Written Test Bench of Empty Condition(Select the below written text -> Edit-> Uncomment Selection)
//Go to Tools → Run Simulation Tool → RTL Simulation.





//Test Bench For Empty Condition


//`timescale 1ns/1ps
//
//module asyncfifo_tb_empty;
//
//    // Testbench signals
//    reg wclk, rclk;
//    reg arst_n;
//    reg wen, ren;
//    reg [7:0] wdata;
//    wire [7:0] rdata;
//    wire full, empty;
//
//    // Instantiate DUT
//    asyncfifo dut (
//        .wclk(wclk),
//        .rclk(rclk),
//        .arst_n(arst_n),
//        .wen(wen),
//        .ren(ren),
//        .wdata(wdata),
//        .rdata(rdata),
//        .full(full),
//        .empty(empty)
//    );
//
//    // Clock generation
//    always #5 wclk = ~wclk;   // write clock = 100 MHz
//    always #7 rclk = ~rclk;   // read clock ≈ 71 MHz
//
//    // Stimulus
//    initial begin
//        // Init
//        wclk = 0; rclk = 0;
//        wen = 0; ren = 0;
//        wdata = 8'd0;
//        arst_n = 0;
//
//        // Apply Reset
//        #20 arst_n = 1;
//      
//        // Try to read from empty FIFO
//        #20 ren = 1;
//        #20 ren = 0;
//
//        #50 
//	$finish;
//    end
//endmodule




//Comment the Above Test Bench of Empty Conditon (Select the above text -> Edit-> Comment Selection)
//Uncomment the Below Written Test Bench of Simultaneous Write and Read Condition(Select the below written text -> Edit-> Uncomment Selection)
//Go to Tools → Run Simulation Tool → RTL Simulation.





//Test bench for Simultaneous Write and Read Condition


//`timescale 1ns/1ps
//
//module asyncfifo_tb;
//
//    reg wclk, rclk;
//    reg arst_n;
//    reg wen, ren;
//    reg [7:0] wdata;
//    wire [7:0] rdata;
//    wire full, empty;
//
//    // DUT
//    asyncfifo dut (
//        .wclk(wclk), .rclk(rclk), .arst_n(arst_n),
//        .wen(wen), .ren(ren), .wdata(wdata),
//        .rdata(rdata), .full(full), .empty(empty)
//    );
//
//    // Clocks
//    always #5 wclk = ~wclk;
//    always #7 rclk = ~rclk;
//
//    integer i;
//
//    initial begin
//        // init
//        wclk = 0; rclk = 0; wen = 0; ren = 0; wdata = 0; arst_n = 0;
//
//        // reset
//        #10 arst_n = 1;
//
//        // simultaneous read + write from 0 to 9
//        for (i = 0; i < 7; i = i + 1) begin
//            @(posedge wclk);
//            wen = 1; 
//	    ren = 1;
//            wdata = i;
//           
//        end
//
//        wen = 0; ren = 0;
//        #20 $finish;
//    end
//endmodule













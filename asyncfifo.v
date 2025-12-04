module asyncfifo (
  input  wclk, wrst_n,
  input  rclk, rrst_n,
  input  w_en, r_en,
  input  [7:0] data_in,      // DATA_WIDTH = 8
  output reg [7:0] data_out,
  output reg full,
  output reg empty
);

  // Fixed parameters for Verilog-2001
  parameter DEPTH = 8;
  parameter PTR_WIDTH = 3;   // ceil(log2(8)) = 3

  // Internal wires for submodule connections
  wire [PTR_WIDTH:0] g_wptr_sync, g_rptr_sync;
  wire [PTR_WIDTH:0] b_wptr, b_rptr;
  wire [PTR_WIDTH:0] g_wptr, g_rptr;
  wire full_wire, empty_wire;
  wire [7:0] data_out_wire;

  // Synchronizers
  synchronizer sync_wptr (
    rclk,
    rrst_n,
    g_wptr,
    g_wptr_sync
  );

  synchronizer sync_rptr (
    wclk,
    wrst_n,
    g_rptr,
    g_rptr_sync
  );

  // Write pointer handler
  wptr_handler wptr_h (
    wclk,
    wrst_n,
    w_en,
    g_rptr_sync,
    b_wptr,
    g_wptr,
    full_wire
  );

  // Read pointer handler
  rptr_handler rptr_h (
    rclk,
    rrst_n,
    r_en,
    g_wptr_sync,
    b_rptr,
    g_rptr,
    empty_wire
  );

  // FIFO memory
  fifo_mem fifom (
    wclk,
    w_en,
    rclk,
    r_en,
    b_wptr,
    b_rptr,
    data_in,
    full_wire,
    empty_wire,
    data_out_wire
  );

  // Assign internal wires to top-level reg outputs
  always @(posedge rclk) begin
    full      <= full_wire;
    empty     <= empty_wire;
    data_out  <= data_out_wire;
  end

endmodule

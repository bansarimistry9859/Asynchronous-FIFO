module fifo_mem #(parameter DEPTH=8, DATA_WIDTH=8, PTR_WIDTH=3) (
  input  wclk, w_en,
  input  rclk, r_en,
  input  [PTR_WIDTH:0] b_wptr, b_rptr,
  input  [DATA_WIDTH-1:0] data_in,
  input  full, empty,
  output reg [DATA_WIDTH-1:0] data_out
);
  reg [DATA_WIDTH-1:0] fifo[0:DEPTH-1];

  // Write process
  always @(posedge wclk) begin
    if (w_en & !full)
      fifo[b_wptr[PTR_WIDTH-1:0]] <= data_in;
  end

  // Read process (drive reg inside always block)
  always @(posedge rclk) begin
    if (r_en & !empty)
      data_out <= fifo[b_rptr[PTR_WIDTH-1:0]];
  end

endmodule

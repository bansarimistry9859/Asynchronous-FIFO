module rptr_handler #(parameter PTR_WIDTH=3) (
  input rclk, rrst_n, r_en,
  input [PTR_WIDTH:0] g_wptr_sync,
  output reg [PTR_WIDTH:0] b_rptr, g_rptr,
  output reg empty
);

  // Fix: use wire for assign
  wire [PTR_WIDTH:0] b_rptr_next;
  wire [PTR_WIDTH:0] g_rptr_next;
  wire rempty;

  // Next-pointer calculations
  assign b_rptr_next = b_rptr + (r_en & !empty);
  assign g_rptr_next = (b_rptr_next >> 1) ^ b_rptr_next;

  // Empty condition
  assign rempty = (g_wptr_sync == g_rptr_next);

  // Binary and Gray read pointer updates
  always @(posedge rclk or negedge rrst_n) begin
    if (!rrst_n) begin
      b_rptr <= 0;
      g_rptr <= 0;
    end else begin
      b_rptr <= b_rptr_next;
      g_rptr <= g_rptr_next;
    end
  end

  // Empty flag update
  always @(posedge rclk or negedge rrst_n) begin
    if (!rrst_n)
      empty <= 1;
    else
      empty <= rempty;
  end

endmodule

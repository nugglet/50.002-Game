/*
   This file was generated automatically by Alchitry Labs version 1.2.1.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module fsmLED_4 (
    input clk,
    input rst,
    output reg outled
  );
  
  
  
  reg [191:0] M_ledcolor_d, M_ledcolor_q = 1'h0;
  
  wire [3-1:0] M_led_strip_pixel;
  wire [1-1:0] M_led_strip_led;
  reg [1-1:0] M_led_strip_update;
  reg [24-1:0] M_led_strip_color;
  ws2812b_writer_8 led_strip (
    .clk(clk),
    .rst(rst),
    .update(M_led_strip_update),
    .color(M_led_strip_color),
    .pixel(M_led_strip_pixel),
    .led(M_led_strip_led)
  );
  
  localparam IDLE_move_led = 4'd0;
  localparam START_move_led = 4'd1;
  localparam LANE1_move_led = 4'd2;
  localparam LANE2_move_led = 4'd3;
  localparam LANE3_move_led = 4'd4;
  localparam LANE4_move_led = 4'd5;
  localparam LANE5_move_led = 4'd6;
  localparam LANE6_move_led = 4'd7;
  localparam LANE7_move_led = 4'd8;
  localparam LANE8_move_led = 4'd9;
  
  reg [3:0] M_move_led_d, M_move_led_q = START_move_led;
  reg [26:0] M_counter_d, M_counter_q = 1'h0;
  
  always @* begin
    M_move_led_d = M_move_led_q;
    M_ledcolor_d = M_ledcolor_q;
    M_counter_d = M_counter_q;
    
    M_led_strip_update = 1'h1;
    M_led_strip_color = M_ledcolor_q[(M_led_strip_pixel)*24+23-:24];
    outled = M_led_strip_led;
    M_counter_d = M_counter_q + 1'h1;
    
    case (M_move_led_q)
      IDLE_move_led: begin
        M_ledcolor_d = 192'h000000000000000000000000000000000000000000000000;
        M_led_strip_color = M_ledcolor_q[(M_led_strip_pixel)*24+23-:24];
        outled = M_led_strip_led;
      end
      START_move_led: begin
        M_ledcolor_d = 192'hffffffffffffffffffffffffffffffffffffffffffff0000;
        M_led_strip_color = M_ledcolor_q[(M_led_strip_pixel)*24+23-:24];
        outled = M_led_strip_led;
        if (M_counter_q[26+0-:1] == 1'h1) begin
          M_move_led_d = LANE1_move_led;
        end else begin
          M_move_led_d = START_move_led;
        end
      end
      LANE1_move_led: begin
        M_ledcolor_d = 192'hffffffffffffffffffffffffffffffffffffff0000ffffff;
        M_led_strip_color = M_ledcolor_q[(M_led_strip_pixel)*24+23-:24];
        outled = M_led_strip_led;
        if (M_counter_q == 1'h1) begin
          M_move_led_d = LANE2_move_led;
        end else begin
          M_move_led_d = LANE1_move_led;
        end
      end
      LANE2_move_led: begin
        M_ledcolor_d = 192'hffffffffffffffffffffffffffffffff0000ffffffffffff;
        M_led_strip_color = M_ledcolor_q[(M_led_strip_pixel)*24+23-:24];
        outled = M_led_strip_led;
        if (M_counter_q == 1'h1) begin
          M_move_led_d = LANE3_move_led;
        end else begin
          M_move_led_d = LANE2_move_led;
        end
      end
      LANE3_move_led: begin
        M_ledcolor_d = 192'hffffffffffffffffffffffffff0000ffffffffffffffffff;
        M_led_strip_color = M_ledcolor_q[(M_led_strip_pixel)*24+23-:24];
        outled = M_led_strip_led;
        if (M_counter_q == 1'h1) begin
          M_move_led_d = LANE4_move_led;
        end else begin
          M_move_led_d = LANE3_move_led;
        end
      end
      LANE4_move_led: begin
        M_ledcolor_d = 192'hffffffffffffffffffff0000ffffffffffffffffffffffff;
        M_led_strip_color = M_ledcolor_q[(M_led_strip_pixel)*24+23-:24];
        outled = M_led_strip_led;
        if (M_counter_q == 1'h1) begin
          M_move_led_d = LANE5_move_led;
        end else begin
          M_move_led_d = LANE4_move_led;
        end
      end
      LANE5_move_led: begin
        M_ledcolor_d = 192'hffffffffffffff0000ffffffffffffffffffffffffffffff;
        M_led_strip_color = M_ledcolor_q[(M_led_strip_pixel)*24+23-:24];
        outled = M_led_strip_led;
        if (M_counter_q == 1'h1) begin
          M_move_led_d = LANE6_move_led;
        end else begin
          M_move_led_d = LANE5_move_led;
        end
      end
      LANE6_move_led: begin
        M_ledcolor_d = 192'hffffffff0000ffffffffffffffffffffffffffffffffffff;
        M_led_strip_color = M_ledcolor_q[(M_led_strip_pixel)*24+23-:24];
        outled = M_led_strip_led;
        if (M_counter_q == 1'h1) begin
          M_move_led_d = LANE7_move_led;
        end else begin
          M_move_led_d = LANE6_move_led;
        end
      end
      LANE7_move_led: begin
        M_ledcolor_d = 192'hff0000ffffffffffffffffffffffffffffffffffffffffff;
        M_led_strip_color = M_ledcolor_q[(M_led_strip_pixel)*24+23-:24];
        outled = M_led_strip_led;
        if (M_counter_q == 1'h1) begin
          M_move_led_d = LANE8_move_led;
        end else begin
          M_move_led_d = LANE7_move_led;
        end
      end
      LANE8_move_led: begin
        M_ledcolor_d = 192'hffffffffffffffffffffffffffffffffffffffffffffffff;
        M_led_strip_color = M_ledcolor_q[(M_led_strip_pixel)*24+23-:24];
        outled = M_led_strip_led;
        if (M_counter_q[26+0-:1] == 1'h1) begin
          M_move_led_d = IDLE_move_led;
        end else begin
          M_move_led_d = LANE8_move_led;
        end
      end
    endcase
  end
  
  always @(posedge clk) begin
    M_ledcolor_q <= M_ledcolor_d;
  end
  
  
  always @(posedge clk) begin
    M_counter_q <= M_counter_d;
    M_move_led_q <= M_move_led_d;
  end
  
endmodule
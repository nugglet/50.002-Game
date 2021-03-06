/*
   This file was generated automatically by Alchitry Labs version 1.2.1.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module shiftPlayer_6 (
    input clk,
    input rst,
    input left_button,
    input right_button,
    output reg [23:0] io_led,
    output reg outled
  );
  
  
  
  reg [143:0] M_ledcolor_d, M_ledcolor_q = 144'h000000000000ff0000000000000000000000;
  
  wire [3-1:0] M_led_strip_pixel;
  wire [1-1:0] M_led_strip_led;
  reg [1-1:0] M_led_strip_update;
  reg [24-1:0] M_led_strip_color;
  ws2812b_writer_10 led_strip (
    .clk(clk),
    .rst(rst),
    .update(M_led_strip_update),
    .color(M_led_strip_color),
    .pixel(M_led_strip_pixel),
    .led(M_led_strip_led)
  );
  
  localparam COL1_movement = 3'd0;
  localparam COL2_movement = 3'd1;
  localparam COL3_movement = 3'd2;
  localparam COL4_movement = 3'd3;
  localparam COL5_movement = 3'd4;
  localparam COL6_movement = 3'd5;
  
  reg [2:0] M_movement_d, M_movement_q = COL1_movement;
  
  always @* begin
    M_movement_d = M_movement_q;
    M_ledcolor_d = M_ledcolor_q;
    
    M_led_strip_update = 1'h1;
    M_led_strip_color = M_ledcolor_q[(M_led_strip_pixel)*24+23-:24];
    outled = M_led_strip_led;
    io_led = 24'h000000;
    
    case (M_movement_q)
      COL1_movement: begin
        if (left_button) begin
          M_led_strip_color = M_ledcolor_q[(M_led_strip_pixel)*24+23-:24];
          outled = M_led_strip_led;
          M_movement_d = COL1_movement;
        end else begin
          if (right_button) begin
            M_ledcolor_d = 144'h000000ff0000000000000000000000000000;
            M_led_strip_color = M_ledcolor_q[(M_led_strip_pixel)*24+23-:24];
            outled = M_led_strip_led;
            M_movement_d = COL2_movement;
          end else begin
            M_led_strip_color = M_ledcolor_q[(M_led_strip_pixel)*24+23-:24];
            outled = M_led_strip_led;
            M_movement_d = COL1_movement;
          end
        end
      end
      COL2_movement: begin
        if (left_button) begin
          M_ledcolor_d = 144'hff0000000000000000000000000000000000;
          M_led_strip_color = M_ledcolor_q[(M_led_strip_pixel)*24+23-:24];
          outled = M_led_strip_led;
          M_movement_d = COL1_movement;
        end else begin
          if (right_button) begin
            M_ledcolor_d = 144'h000000000000ff0000000000000000000000;
            M_led_strip_color = M_ledcolor_q[(M_led_strip_pixel)*24+23-:24];
            outled = M_led_strip_led;
            M_movement_d = COL3_movement;
          end else begin
            M_led_strip_color = M_ledcolor_q[(M_led_strip_pixel)*24+23-:24];
            outled = M_led_strip_led;
            M_movement_d = COL2_movement;
          end
        end
      end
      COL3_movement: begin
        if (left_button) begin
          M_ledcolor_d = 144'h000000ff0000000000000000000000000000;
          M_led_strip_color = M_ledcolor_q[(M_led_strip_pixel)*24+23-:24];
          outled = M_led_strip_led;
          M_movement_d = COL2_movement;
        end else begin
          if (right_button) begin
            M_ledcolor_d = 144'h000000000000000000ff0000000000000000;
            M_led_strip_color = M_ledcolor_q[(M_led_strip_pixel)*24+23-:24];
            outled = M_led_strip_led;
            M_movement_d = COL4_movement;
          end else begin
            M_led_strip_color = M_ledcolor_q[(M_led_strip_pixel)*24+23-:24];
            outled = M_led_strip_led;
            M_movement_d = COL3_movement;
          end
        end
      end
      COL4_movement: begin
        if (left_button) begin
          M_ledcolor_d = 144'h000000000000ff0000000000000000000000;
          M_led_strip_color = M_ledcolor_q[(M_led_strip_pixel)*24+23-:24];
          outled = M_led_strip_led;
          M_movement_d = COL3_movement;
        end else begin
          if (right_button) begin
            M_ledcolor_d = 144'h000000000000000000000000ff0000000000;
            M_led_strip_color = M_ledcolor_q[(M_led_strip_pixel)*24+23-:24];
            outled = M_led_strip_led;
            M_movement_d = COL5_movement;
          end else begin
            M_led_strip_color = M_ledcolor_q[(M_led_strip_pixel)*24+23-:24];
            outled = M_led_strip_led;
            M_movement_d = COL4_movement;
          end
        end
      end
      COL5_movement: begin
        if (left_button) begin
          M_ledcolor_d = 144'h000000000000000000ff0000000000000000;
          M_led_strip_color = M_ledcolor_q[(M_led_strip_pixel)*24+23-:24];
          outled = M_led_strip_led;
          M_movement_d = COL4_movement;
        end else begin
          if (right_button) begin
            M_ledcolor_d = 144'h000000000000000000000000000000ff0000;
            M_led_strip_color = M_ledcolor_q[(M_led_strip_pixel)*24+23-:24];
            outled = M_led_strip_led;
            M_movement_d = COL6_movement;
          end else begin
            M_led_strip_color = M_ledcolor_q[(M_led_strip_pixel)*24+23-:24];
            outled = M_led_strip_led;
            M_movement_d = COL5_movement;
          end
        end
      end
      COL6_movement: begin
        if (left_button) begin
          M_ledcolor_d = 144'h000000000000000000000000ff0000000000;
          M_led_strip_color = M_ledcolor_q[(M_led_strip_pixel)*24+23-:24];
          outled = M_led_strip_led;
          M_movement_d = COL5_movement;
        end else begin
          if (right_button) begin
            M_led_strip_color = M_ledcolor_q[(M_led_strip_pixel)*24+23-:24];
            outled = M_led_strip_led;
            M_movement_d = COL6_movement;
          end else begin
            M_led_strip_color = M_ledcolor_q[(M_led_strip_pixel)*24+23-:24];
            outled = M_led_strip_led;
            M_movement_d = COL6_movement;
          end
        end
      end
    endcase
  end
  
  always @(posedge clk) begin
    M_ledcolor_q <= M_ledcolor_d;
  end
  
  
  always @(posedge clk) begin
    M_movement_q <= M_movement_d;
  end
  
endmodule

/*
   This file was generated automatically by Alchitry Labs version 1.2.1.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module initialise_player_LED_5 (
    input [15:0] player,
    output reg [143:0] playerled
  );
  
  
  
  integer i;
  
  always @* begin
    playerled = 144'h000000000000000000000000000000000000;
    for (i = 1'h0; i < 3'h6; i = i + 1) begin
      if (player[(i)*1+0-:1] == 1'h1) begin
        playerled[(i)*24+23-:24] = 24'hff0000;
      end else begin
        playerled[(i)*24+23-:24] = 24'h000000;
      end
    end
  end
endmodule
module antirebote(input clk, reset, a,
                  output y);
  reg state, nextstate;
  parameter  S0 = 1'b0;
  parameter  S1 = 1'b1;

  always @ (posedge clk, posedge reset)
    if (reset) state <= S0;
    else       state <= nextstate;

  //States
  always @(*)
    case(state)
      S0:  if (a) nextstate = S1;
           else   nextstate = S0;
      S1: if(~a) nextstate = S0;
          else   nextstate = S1;
    endcase
  //output
  assign y = (a & state==S0);
endmodule



module alarm (input clk, reset, a,
              output y);

reg [1:0] state, nextstate;

parameter S0 = 2'b00;
parameter S1 = 2'b01;
parameter S2 = 2'b10;
parameter S3 = 2'b11;

always @ (posedge clk, posedge reset)
  if (reset) state <= S0;
  else       state <= nextstate;

//States
always @ ( * )
  case(state)
    S0: if(a) nextstate = S1;
        else  nextstate = S0;
    S1: if(a) nextstate = S2;
        else  nextstate = S0;
    S2: if(a) nextstate = S3;
        else  nextstate = S0;
    S3: if(a) nextstate = S2;
        else  nextstate = S0;
  endcase

//output
assign y = (a & state == S3);
endmodule // alarm

//Movement
module movement(input clk, reset, l_in, r_in,
                output [2:0] state_out);

  wire l, r;

  reg [2:0] state, nextstate;
  parameter S0 = 3'b000;
  parameter L1 = 3'b001;
  parameter L2 = 3'b010;
  parameter L3 = 3'b011;
  parameter R1 = 3'b100;
  parameter R2 = 3'b101;
  parameter R3 = 3'b110;
  parameter RE = 3'b111;

  antirebote al(clk, reset, l_in, l_out);
  antirebote ar(clk, reset, r_in, r_out);

  always @ ( posedge clk, posedge reset)
    if (reset) state <= S0;
    else       state <= nextstate;

  //states
  always @ (*)
    case(state)
    S0: if (l_out&~r_out) nextstate = L1;
        else if (~l_out&r_out) nextstate = R1;
        else      nextstate = S0;
    L1: if (l_out&~r_out) nextstate = L2;
        else if (~l_out&r_out) nextstate = S0;
        else      nextstate = L1;
    L2: if (l_out&~r_out) nextstate = L3;
        else if (~l_out&r_out) nextstate = L1;
        else      nextstate = L2;
    L3: if (~l_out&r_out) nextstate = L2;
        else      nextstate = L3;
    R1: if (l_out&~r_out) nextstate = S0;
        else if (~l_out&r_out) nextstate = R2;
        else      nextstate = R1;
    R2: if (l_out&~r_out) nextstate = R1;
        else if (~l_out&r_out) nextstate = R3;
        else      nextstate = R2;
    R3: if (l_out&~r_out) nextstate = R2;
        else      nextstate = R3;
    endcase

  //output
  assign state_out = state;
endmodule

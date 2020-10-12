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
                output [2:0] state_out,
                output danger);

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
  assign danger = (state == R3 | state == L3);
endmodule

//ENGINE
module engine(input clk, reset, b_in, f_in,
              output [1:0] state_out);

  reg[1:0] state, nextstate;
  parameter  S0 = 2'b00;
  parameter  F1 = 2'b01;
  parameter  F2 = 2'b11;
  parameter  B1 = 2'b10;

  antirebote ab(clk, reset, b_in, b_out);
  antirebote af(clk, reset, f_in, f_out);

  always @ ( posedge clk, posedge reset)
    if (reset) state <= S0;
    else       state <= nextstate;

  //states
  always @ (*)
    case(state)
    S0: if (b_out&~f_out) nextstate = B1;
        else if (~b_out&f_out) nextstate = F1;
        else              nextstate = S0;
    B1: if (~b_out&f_out) nextstate = S0;
        else              nextstate = B1;
    F1: if (b_out&~f_out) nextstate = S0;
        else if (~b_out&f_out) nextstate = F2;
        else              nextstate = F1;
    F2: if (b_out&~f_out) nextstate = F1;
        else              nextstate = F2;
    endcase

  //output
  assign state_out = state;
endmodule

//FINAL
module full (input clk, reset, l_in, r_in, u_in, d_in, f_in, b_in,
              input [1:0] auto,
              output [2:0] left_right, up_down,
              output [1:0] forward_backward,
              output alarm);
  assign l = l_in&auto[1];
  assign r = r_in&auto[1];
  assign u = u_in&auto[1];
  assign d = d_in&auto[1];
  assign f = f_in&auto[0];
  assign b = b_in&auto[0];
  wire dangerLR, dangerUD, danger;
  assign danger = dangerLR|dangerUD;

  movement LR(clk, reset, l, r, left_right, dangerLR);
  movement UD(clk, reset, d, u, up_down, dangerUD);
  engine engine(clk, reset, b, f, forward_backward);
  alarm ALARM(clk, reset, danger, alarm);
endmodule // full

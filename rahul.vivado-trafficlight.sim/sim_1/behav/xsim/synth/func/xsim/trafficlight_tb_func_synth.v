// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.1 (lin64) Build 6140274 Wed May 21 22:58:25 MDT 2025
// Date        : Sun Jul 27 14:09:42 2025
// Host        : THANDA running 64-bit Arch Linux
// Command     : write_verilog -mode funcsim -nolib -force -file
//               /home/thanda/Documents/vivado/rahul.vivado-trafficlight/rahul.vivado-trafficlight.sim/sim_1/synth/func/xsim/trafficlight_tb_func_synth.v
// Design      : trafficlight_controller
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7s50fgga484-1Q
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* GREEN = "2'b01" *) (* RED = "2'b00" *) (* S0 = "3'b000" *) 
(* S1 = "3'b001" *) (* S2 = "3'b010" *) (* S3 = "3'b011" *) 
(* S4 = "3'b100" *) (* YELLOW = "2'b10" *) 
(* NotValidForBitStream *)
module trafficlight_controller
   (clock,
    clear,
    x,
    hwy,
    road);
  input clock;
  input clear;
  input x;
  output [1:0]hwy;
  output [1:0]road;

  wire \FSM_onehot_state[4]_i_1_n_0 ;
  wire \FSM_onehot_state[4]_i_2_n_0 ;
  wire \FSM_onehot_state_reg_n_0_[2] ;
  wire clear;
  wire clear_IBUF;
  wire clock;
  wire clock_IBUF;
  wire clock_IBUF_BUFG;
  wire \delay[0]_i_1_n_0 ;
  wire \delay[1]_i_1_n_0 ;
  wire [1:0]delay__0;
  wire [1:0]hwy;
  wire [1:0]hwy_OBUF;
  wire [1:0]road;
  wire [1:0]road_OBUF;
  wire x;
  wire x_IBUF;

  LUT4 #(
    .INIT(16'hFFAC)) 
    \FSM_onehot_state[4]_i_1 
       (.I0(hwy_OBUF[0]),
        .I1(road_OBUF[0]),
        .I2(x_IBUF),
        .I3(\FSM_onehot_state[4]_i_2_n_0 ),
        .O(\FSM_onehot_state[4]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h0E0EF000)) 
    \FSM_onehot_state[4]_i_2 
       (.I0(hwy_OBUF[1]),
        .I1(road_OBUF[1]),
        .I2(delay__0[0]),
        .I3(\FSM_onehot_state_reg_n_0_[2] ),
        .I4(delay__0[1]),
        .O(\FSM_onehot_state[4]_i_2_n_0 ));
  (* FSM_ENCODED_STATES = "S0:00001,S1:00010,S2:00100,S3:01000,S4:10000," *) 
  FDSE #(
    .INIT(1'b1)) 
    \FSM_onehot_state_reg[0] 
       (.C(clock_IBUF_BUFG),
        .CE(\FSM_onehot_state[4]_i_1_n_0 ),
        .D(road_OBUF[1]),
        .Q(hwy_OBUF[0]),
        .S(clear_IBUF));
  (* FSM_ENCODED_STATES = "S0:00001,S1:00010,S2:00100,S3:01000,S4:10000," *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_state_reg[1] 
       (.C(clock_IBUF_BUFG),
        .CE(\FSM_onehot_state[4]_i_1_n_0 ),
        .D(hwy_OBUF[0]),
        .Q(hwy_OBUF[1]),
        .R(clear_IBUF));
  (* FSM_ENCODED_STATES = "S0:00001,S1:00010,S2:00100,S3:01000,S4:10000," *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_state_reg[2] 
       (.C(clock_IBUF_BUFG),
        .CE(\FSM_onehot_state[4]_i_1_n_0 ),
        .D(hwy_OBUF[1]),
        .Q(\FSM_onehot_state_reg_n_0_[2] ),
        .R(clear_IBUF));
  (* FSM_ENCODED_STATES = "S0:00001,S1:00010,S2:00100,S3:01000,S4:10000," *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_state_reg[3] 
       (.C(clock_IBUF_BUFG),
        .CE(\FSM_onehot_state[4]_i_1_n_0 ),
        .D(\FSM_onehot_state_reg_n_0_[2] ),
        .Q(road_OBUF[0]),
        .R(clear_IBUF));
  (* FSM_ENCODED_STATES = "S0:00001,S1:00010,S2:00100,S3:01000,S4:10000," *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_state_reg[4] 
       (.C(clock_IBUF_BUFG),
        .CE(\FSM_onehot_state[4]_i_1_n_0 ),
        .D(road_OBUF[0]),
        .Q(road_OBUF[1]),
        .R(clear_IBUF));
  IBUF clear_IBUF_inst
       (.I(clear),
        .O(clear_IBUF));
  BUFG clock_IBUF_BUFG_inst
       (.I(clock_IBUF),
        .O(clock_IBUF_BUFG));
  IBUF clock_IBUF_inst
       (.I(clock),
        .O(clock_IBUF));
  LUT6 #(
    .INIT(64'h0000000044465556)) 
    \delay[0]_i_1 
       (.I0(delay__0[0]),
        .I1(\FSM_onehot_state_reg_n_0_[2] ),
        .I2(hwy_OBUF[1]),
        .I3(road_OBUF[1]),
        .I4(delay__0[1]),
        .I5(clear_IBUF),
        .O(\delay[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h000000005552888A)) 
    \delay[1]_i_1 
       (.I0(delay__0[1]),
        .I1(\FSM_onehot_state_reg_n_0_[2] ),
        .I2(hwy_OBUF[1]),
        .I3(road_OBUF[1]),
        .I4(delay__0[0]),
        .I5(clear_IBUF),
        .O(\delay[1]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \delay_reg[0] 
       (.C(clock_IBUF_BUFG),
        .CE(1'b1),
        .D(\delay[0]_i_1_n_0 ),
        .Q(delay__0[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \delay_reg[1] 
       (.C(clock_IBUF_BUFG),
        .CE(1'b1),
        .D(\delay[1]_i_1_n_0 ),
        .Q(delay__0[1]),
        .R(1'b0));
  OBUF \hwy_OBUF[0]_inst 
       (.I(hwy_OBUF[0]),
        .O(hwy[0]));
  OBUF \hwy_OBUF[1]_inst 
       (.I(hwy_OBUF[1]),
        .O(hwy[1]));
  OBUF \road_OBUF[0]_inst 
       (.I(road_OBUF[0]),
        .O(road[0]));
  OBUF \road_OBUF[1]_inst 
       (.I(road_OBUF[1]),
        .O(road[1]));
  IBUF x_IBUF_inst
       (.I(x),
        .O(x_IBUF));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif

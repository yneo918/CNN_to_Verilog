// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.1 (lin64) Build 2902540 Wed May 27 19:54:35 MDT 2020
// Date        : Sat Mar 12 01:02:09 2022
// Host        : lepus running 64-bit CentOS Linux release 7.9.2009 (Core)
// Command     : write_verilog -force ./output/conv2_13/export/top-netlist.v -mode timesim -sdf_anno true
// Design      : top
// Purpose     : This verilog netlist is a timing simulation representation of the design and should not be modified or
//               synthesized. Please ensure that this netlist is used with the corresponding SDF file.
// Device      : xcvu9p-flga2104-2L-e
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps
`define XIL_TIMING

module IBUF_UNIQ_BASE_
   (O,
    I);
  output O;
  input I;

  wire I;
  wire O;
  wire OUT;
  wire NLW_IBUFCTRL_INST_IBUFDISABLE_UNCONNECTED;
  wire NLW_IBUFCTRL_INST_INTERMDISABLE_UNCONNECTED;
  wire NLW_IBUFCTRL_INST_T_UNCONNECTED;
  wire NLW_INBUF_INST_OSC_EN_UNCONNECTED;
  wire NLW_INBUF_INST_VREF_UNCONNECTED;
  wire [3:0]NLW_INBUF_INST_OSC_UNCONNECTED;

  IBUFCTRL IBUFCTRL_INST
       (.I(OUT),
        .IBUFDISABLE(NLW_IBUFCTRL_INST_IBUFDISABLE_UNCONNECTED),
        .INTERMDISABLE(NLW_IBUFCTRL_INST_INTERMDISABLE_UNCONNECTED),
        .O(O),
        .T(NLW_IBUFCTRL_INST_T_UNCONNECTED));
  INBUF INBUF_INST
       (.O(OUT),
        .OSC(NLW_INBUF_INST_OSC_UNCONNECTED[3:0]),
        .OSC_EN(NLW_INBUF_INST_OSC_EN_UNCONNECTED),
        .PAD(I),
        .VREF(NLW_INBUF_INST_VREF_UNCONNECTED));
endmodule

module IBUF_HD1
   (O,
    I);
  output O;
  input I;

  wire I;
  wire O;
  wire OUT;
  wire NLW_IBUFCTRL_INST_IBUFDISABLE_UNCONNECTED;
  wire NLW_IBUFCTRL_INST_INTERMDISABLE_UNCONNECTED;
  wire NLW_IBUFCTRL_INST_T_UNCONNECTED;
  wire NLW_INBUF_INST_OSC_EN_UNCONNECTED;
  wire NLW_INBUF_INST_VREF_UNCONNECTED;
  wire [3:0]NLW_INBUF_INST_OSC_UNCONNECTED;

  IBUFCTRL IBUFCTRL_INST
       (.I(OUT),
        .IBUFDISABLE(NLW_IBUFCTRL_INST_IBUFDISABLE_UNCONNECTED),
        .INTERMDISABLE(NLW_IBUFCTRL_INST_INTERMDISABLE_UNCONNECTED),
        .O(O),
        .T(NLW_IBUFCTRL_INST_T_UNCONNECTED));
  INBUF INBUF_INST
       (.O(OUT),
        .OSC(NLW_INBUF_INST_OSC_UNCONNECTED[3:0]),
        .OSC_EN(NLW_INBUF_INST_OSC_EN_UNCONNECTED),
        .PAD(I),
        .VREF(NLW_INBUF_INST_VREF_UNCONNECTED));
endmodule

module IBUF_HD2
   (O,
    I);
  output O;
  input I;

  wire I;
  wire O;
  wire OUT;
  wire NLW_IBUFCTRL_INST_IBUFDISABLE_UNCONNECTED;
  wire NLW_IBUFCTRL_INST_INTERMDISABLE_UNCONNECTED;
  wire NLW_IBUFCTRL_INST_T_UNCONNECTED;
  wire NLW_INBUF_INST_OSC_EN_UNCONNECTED;
  wire NLW_INBUF_INST_VREF_UNCONNECTED;
  wire [3:0]NLW_INBUF_INST_OSC_UNCONNECTED;

  IBUFCTRL IBUFCTRL_INST
       (.I(OUT),
        .IBUFDISABLE(NLW_IBUFCTRL_INST_IBUFDISABLE_UNCONNECTED),
        .INTERMDISABLE(NLW_IBUFCTRL_INST_INTERMDISABLE_UNCONNECTED),
        .O(O),
        .T(NLW_IBUFCTRL_INST_T_UNCONNECTED));
  INBUF INBUF_INST
       (.O(OUT),
        .OSC(NLW_INBUF_INST_OSC_UNCONNECTED[3:0]),
        .OSC_EN(NLW_INBUF_INST_OSC_EN_UNCONNECTED),
        .PAD(I),
        .VREF(NLW_INBUF_INST_VREF_UNCONNECTED));
endmodule

module IBUF_HD3
   (O,
    I);
  output O;
  input I;

  wire I;
  wire O;
  wire OUT;
  wire NLW_IBUFCTRL_INST_IBUFDISABLE_UNCONNECTED;
  wire NLW_IBUFCTRL_INST_INTERMDISABLE_UNCONNECTED;
  wire NLW_IBUFCTRL_INST_T_UNCONNECTED;
  wire NLW_INBUF_INST_OSC_EN_UNCONNECTED;
  wire NLW_INBUF_INST_VREF_UNCONNECTED;
  wire [3:0]NLW_INBUF_INST_OSC_UNCONNECTED;

  IBUFCTRL IBUFCTRL_INST
       (.I(OUT),
        .IBUFDISABLE(NLW_IBUFCTRL_INST_IBUFDISABLE_UNCONNECTED),
        .INTERMDISABLE(NLW_IBUFCTRL_INST_INTERMDISABLE_UNCONNECTED),
        .O(O),
        .T(NLW_IBUFCTRL_INST_T_UNCONNECTED));
  INBUF INBUF_INST
       (.O(OUT),
        .OSC(NLW_INBUF_INST_OSC_UNCONNECTED[3:0]),
        .OSC_EN(NLW_INBUF_INST_OSC_EN_UNCONNECTED),
        .PAD(I),
        .VREF(NLW_INBUF_INST_VREF_UNCONNECTED));
endmodule

module IBUF_HD4
   (O,
    I);
  output O;
  input I;

  wire I;
  wire O;
  wire OUT;
  wire NLW_IBUFCTRL_INST_IBUFDISABLE_UNCONNECTED;
  wire NLW_IBUFCTRL_INST_INTERMDISABLE_UNCONNECTED;
  wire NLW_IBUFCTRL_INST_T_UNCONNECTED;
  wire NLW_INBUF_INST_OSC_EN_UNCONNECTED;
  wire NLW_INBUF_INST_VREF_UNCONNECTED;
  wire [3:0]NLW_INBUF_INST_OSC_UNCONNECTED;

  IBUFCTRL IBUFCTRL_INST
       (.I(OUT),
        .IBUFDISABLE(NLW_IBUFCTRL_INST_IBUFDISABLE_UNCONNECTED),
        .INTERMDISABLE(NLW_IBUFCTRL_INST_INTERMDISABLE_UNCONNECTED),
        .O(O),
        .T(NLW_IBUFCTRL_INST_T_UNCONNECTED));
  INBUF INBUF_INST
       (.O(OUT),
        .OSC(NLW_INBUF_INST_OSC_UNCONNECTED[3:0]),
        .OSC_EN(NLW_INBUF_INST_OSC_EN_UNCONNECTED),
        .PAD(I),
        .VREF(NLW_INBUF_INST_VREF_UNCONNECTED));
endmodule

module IBUF_HD5
   (O,
    I);
  output O;
  input I;

  wire I;
  wire O;
  wire OUT;
  wire NLW_IBUFCTRL_INST_IBUFDISABLE_UNCONNECTED;
  wire NLW_IBUFCTRL_INST_INTERMDISABLE_UNCONNECTED;
  wire NLW_IBUFCTRL_INST_T_UNCONNECTED;
  wire NLW_INBUF_INST_OSC_EN_UNCONNECTED;
  wire NLW_INBUF_INST_VREF_UNCONNECTED;
  wire [3:0]NLW_INBUF_INST_OSC_UNCONNECTED;

  IBUFCTRL IBUFCTRL_INST
       (.I(OUT),
        .IBUFDISABLE(NLW_IBUFCTRL_INST_IBUFDISABLE_UNCONNECTED),
        .INTERMDISABLE(NLW_IBUFCTRL_INST_INTERMDISABLE_UNCONNECTED),
        .O(O),
        .T(NLW_IBUFCTRL_INST_T_UNCONNECTED));
  INBUF INBUF_INST
       (.O(OUT),
        .OSC(NLW_INBUF_INST_OSC_UNCONNECTED[3:0]),
        .OSC_EN(NLW_INBUF_INST_OSC_EN_UNCONNECTED),
        .PAD(I),
        .VREF(NLW_INBUF_INST_VREF_UNCONNECTED));
endmodule

module IBUF_HD6
   (O,
    I);
  output O;
  input I;

  wire I;
  wire O;
  wire OUT;
  wire NLW_IBUFCTRL_INST_IBUFDISABLE_UNCONNECTED;
  wire NLW_IBUFCTRL_INST_INTERMDISABLE_UNCONNECTED;
  wire NLW_IBUFCTRL_INST_T_UNCONNECTED;
  wire NLW_INBUF_INST_OSC_EN_UNCONNECTED;
  wire NLW_INBUF_INST_VREF_UNCONNECTED;
  wire [3:0]NLW_INBUF_INST_OSC_UNCONNECTED;

  IBUFCTRL IBUFCTRL_INST
       (.I(OUT),
        .IBUFDISABLE(NLW_IBUFCTRL_INST_IBUFDISABLE_UNCONNECTED),
        .INTERMDISABLE(NLW_IBUFCTRL_INST_INTERMDISABLE_UNCONNECTED),
        .O(O),
        .T(NLW_IBUFCTRL_INST_T_UNCONNECTED));
  INBUF INBUF_INST
       (.O(OUT),
        .OSC(NLW_INBUF_INST_OSC_UNCONNECTED[3:0]),
        .OSC_EN(NLW_INBUF_INST_OSC_EN_UNCONNECTED),
        .PAD(I),
        .VREF(NLW_INBUF_INST_VREF_UNCONNECTED));
endmodule

module IBUF_HD7
   (O,
    I);
  output O;
  input I;

  wire I;
  wire O;
  wire OUT;
  wire NLW_IBUFCTRL_INST_IBUFDISABLE_UNCONNECTED;
  wire NLW_IBUFCTRL_INST_INTERMDISABLE_UNCONNECTED;
  wire NLW_IBUFCTRL_INST_T_UNCONNECTED;
  wire NLW_INBUF_INST_OSC_EN_UNCONNECTED;
  wire NLW_INBUF_INST_VREF_UNCONNECTED;
  wire [3:0]NLW_INBUF_INST_OSC_UNCONNECTED;

  IBUFCTRL IBUFCTRL_INST
       (.I(OUT),
        .IBUFDISABLE(NLW_IBUFCTRL_INST_IBUFDISABLE_UNCONNECTED),
        .INTERMDISABLE(NLW_IBUFCTRL_INST_INTERMDISABLE_UNCONNECTED),
        .O(O),
        .T(NLW_IBUFCTRL_INST_T_UNCONNECTED));
  INBUF INBUF_INST
       (.O(OUT),
        .OSC(NLW_INBUF_INST_OSC_UNCONNECTED[3:0]),
        .OSC_EN(NLW_INBUF_INST_OSC_EN_UNCONNECTED),
        .PAD(I),
        .VREF(NLW_INBUF_INST_VREF_UNCONNECTED));
endmodule

module IBUF_HD8
   (O,
    I);
  output O;
  input I;

  wire I;
  wire O;
  wire OUT;
  wire NLW_IBUFCTRL_INST_IBUFDISABLE_UNCONNECTED;
  wire NLW_IBUFCTRL_INST_INTERMDISABLE_UNCONNECTED;
  wire NLW_IBUFCTRL_INST_T_UNCONNECTED;
  wire NLW_INBUF_INST_OSC_EN_UNCONNECTED;
  wire NLW_INBUF_INST_VREF_UNCONNECTED;
  wire [3:0]NLW_INBUF_INST_OSC_UNCONNECTED;

  IBUFCTRL IBUFCTRL_INST
       (.I(OUT),
        .IBUFDISABLE(NLW_IBUFCTRL_INST_IBUFDISABLE_UNCONNECTED),
        .INTERMDISABLE(NLW_IBUFCTRL_INST_INTERMDISABLE_UNCONNECTED),
        .O(O),
        .T(NLW_IBUFCTRL_INST_T_UNCONNECTED));
  INBUF INBUF_INST
       (.O(OUT),
        .OSC(NLW_INBUF_INST_OSC_UNCONNECTED[3:0]),
        .OSC_EN(NLW_INBUF_INST_OSC_EN_UNCONNECTED),
        .PAD(I),
        .VREF(NLW_INBUF_INST_VREF_UNCONNECTED));
endmodule

module IBUF_HD9
   (O,
    I);
  output O;
  input I;

  wire I;
  wire O;
  wire OUT;
  wire NLW_IBUFCTRL_INST_IBUFDISABLE_UNCONNECTED;
  wire NLW_IBUFCTRL_INST_INTERMDISABLE_UNCONNECTED;
  wire NLW_IBUFCTRL_INST_T_UNCONNECTED;
  wire NLW_INBUF_INST_OSC_EN_UNCONNECTED;
  wire NLW_INBUF_INST_VREF_UNCONNECTED;
  wire [3:0]NLW_INBUF_INST_OSC_UNCONNECTED;

  IBUFCTRL IBUFCTRL_INST
       (.I(OUT),
        .IBUFDISABLE(NLW_IBUFCTRL_INST_IBUFDISABLE_UNCONNECTED),
        .INTERMDISABLE(NLW_IBUFCTRL_INST_INTERMDISABLE_UNCONNECTED),
        .O(O),
        .T(NLW_IBUFCTRL_INST_T_UNCONNECTED));
  INBUF INBUF_INST
       (.O(OUT),
        .OSC(NLW_INBUF_INST_OSC_UNCONNECTED[3:0]),
        .OSC_EN(NLW_INBUF_INST_OSC_EN_UNCONNECTED),
        .PAD(I),
        .VREF(NLW_INBUF_INST_VREF_UNCONNECTED));
endmodule

(* ORIG_REF_NAME = "add2" *) 
module add2__parameterized5
   (I56,
    O,
    reg_out,
    S);
  output [20:0]I56;
  input [7:0]O;
  input [1:0]reg_out;
  input [1:0]S;

  wire [20:0]I56;
  wire [7:0]O;
  wire [1:0]S;
  wire out__24_carry__0_i_1_n_0;
  wire out__24_carry__0_i_2_n_0;
  wire out__24_carry__0_i_3_n_0;
  wire out__24_carry__0_i_4_n_0;
  wire out__24_carry__0_i_5_n_0;
  wire out__24_carry__0_i_6_n_0;
  wire out__24_carry__0_i_7_n_0;
  wire out__24_carry__0_i_8_n_0;
  wire out__24_carry__0_n_0;
  wire out__24_carry__0_n_10;
  wire out__24_carry__0_n_11;
  wire out__24_carry__0_n_12;
  wire out__24_carry__0_n_13;
  wire out__24_carry__0_n_14;
  wire out__24_carry__0_n_15;
  wire out__24_carry__0_n_8;
  wire out__24_carry__0_n_9;
  wire out__24_carry__1_i_1_n_0;
  wire out__24_carry__1_n_15;
  wire out__24_carry__1_n_6;
  wire out__24_carry_n_0;
  wire out__24_carry_n_10;
  wire out__24_carry_n_11;
  wire out__24_carry_n_12;
  wire out__24_carry_n_13;
  wire out__24_carry_n_14;
  wire out__24_carry_n_8;
  wire out__24_carry_n_9;
  wire out__57_carry__0_n_0;
  wire out__57_carry__0_n_10;
  wire out__57_carry__0_n_11;
  wire out__57_carry__0_n_12;
  wire out__57_carry__0_n_13;
  wire out__57_carry__0_n_14;
  wire out__57_carry__0_n_15;
  wire out__57_carry__0_n_8;
  wire out__57_carry__0_n_9;
  wire out__57_carry__1_i_1_n_0;
  wire out__57_carry__1_i_2_n_0;
  wire out__57_carry__1_i_3_n_0;
  wire out__57_carry__1_n_13;
  wire out__57_carry__1_n_14;
  wire out__57_carry__1_n_15;
  wire out__57_carry__1_n_4;
  wire out__57_carry_n_0;
  wire out__57_carry_n_10;
  wire out__57_carry_n_11;
  wire out__57_carry_n_12;
  wire out__57_carry_n_13;
  wire out__57_carry_n_14;
  wire out__57_carry_n_8;
  wire out__57_carry_n_9;
  wire out__94_carry__0_n_0;
  wire out__94_carry__1_i_1_n_0;
  wire out__94_carry__1_i_2_n_0;
  wire out__94_carry__1_i_3_n_0;
  wire out__94_carry_n_0;
  wire out_carry__0_n_12;
  wire out_carry__0_n_13;
  wire out_carry__0_n_14;
  wire out_carry__0_n_15;
  wire out_carry__0_n_3;
  wire out_carry_n_0;
  wire out_carry_n_10;
  wire out_carry_n_11;
  wire out_carry_n_12;
  wire out_carry_n_13;
  wire out_carry_n_14;
  wire out_carry_n_8;
  wire out_carry_n_9;
  wire [1:0]reg_out;
  wire [6:0]NLW_out__24_carry_CO_UNCONNECTED;
  wire [0:0]NLW_out__24_carry_O_UNCONNECTED;
  wire [6:0]NLW_out__24_carry__0_CO_UNCONNECTED;
  wire [7:0]NLW_out__24_carry__1_CO_UNCONNECTED;
  wire [7:1]NLW_out__24_carry__1_O_UNCONNECTED;
  wire [6:0]NLW_out__57_carry_CO_UNCONNECTED;
  wire [0:0]NLW_out__57_carry_O_UNCONNECTED;
  wire [6:0]NLW_out__57_carry__0_CO_UNCONNECTED;
  wire [7:0]NLW_out__57_carry__1_CO_UNCONNECTED;
  wire [7:3]NLW_out__57_carry__1_O_UNCONNECTED;
  wire [6:0]NLW_out__94_carry_CO_UNCONNECTED;
  wire [0:0]NLW_out__94_carry_O_UNCONNECTED;
  wire [6:0]NLW_out__94_carry__0_CO_UNCONNECTED;
  wire [7:0]NLW_out__94_carry__1_CO_UNCONNECTED;
  wire [7:6]NLW_out__94_carry__1_O_UNCONNECTED;
  wire [6:0]NLW_out_carry_CO_UNCONNECTED;
  wire [0:0]NLW_out_carry_O_UNCONNECTED;
  wire [7:0]NLW_out_carry__0_CO_UNCONNECTED;
  wire [7:4]NLW_out_carry__0_O_UNCONNECTED;

  (* OPT_MODIFIED = "POST_PROCESS_NETLIST" *) 
  CARRY8 out__24_carry
       (.CI(1'b0),
        .CI_TOP(1'b0),
        .CO({out__24_carry_n_0,NLW_out__24_carry_CO_UNCONNECTED[6:0]}),
        .DI({out_carry_n_8,out_carry_n_9,out_carry_n_10,out_carry_n_11,out_carry_n_12,out_carry_n_13,out_carry_n_14,1'b0}),
        .O({out__24_carry_n_8,out__24_carry_n_9,out__24_carry_n_10,out__24_carry_n_11,out__24_carry_n_12,out__24_carry_n_13,out__24_carry_n_14,NLW_out__24_carry_O_UNCONNECTED[0]}),
        .S({out_carry_n_8,out_carry_n_9,out_carry_n_10,out_carry_n_11,out_carry_n_12,out_carry_n_13,out_carry_n_14,1'b0}));
  (* OPT_MODIFIED = "POST_PROCESS_NETLIST" *) 
  CARRY8 out__24_carry__0
       (.CI(out__24_carry_n_0),
        .CI_TOP(1'b0),
        .CO({out__24_carry__0_n_0,NLW_out__24_carry__0_CO_UNCONNECTED[6:0]}),
        .DI({out__24_carry__0_i_1_n_0,out__24_carry__0_i_2_n_0,out__24_carry__0_i_3_n_0,out__24_carry__0_i_4_n_0,out_carry__0_n_12,out_carry__0_n_13,out_carry__0_n_14,out_carry__0_n_15}),
        .O({out__24_carry__0_n_8,out__24_carry__0_n_9,out__24_carry__0_n_10,out__24_carry__0_n_11,out__24_carry__0_n_12,out__24_carry__0_n_13,out__24_carry__0_n_14,out__24_carry__0_n_15}),
        .S({out__24_carry__0_i_5_n_0,out__24_carry__0_i_6_n_0,out__24_carry__0_i_7_n_0,out__24_carry__0_i_8_n_0,out_carry__0_n_12,out_carry__0_n_13,out_carry__0_n_14,out_carry__0_n_15}));
  LUT1 #(
    .INIT(2'h1)) 
    out__24_carry__0_i_1
       (.I0(out_carry__0_n_3),
        .O(out__24_carry__0_i_1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    out__24_carry__0_i_2
       (.I0(out_carry__0_n_3),
        .O(out__24_carry__0_i_2_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    out__24_carry__0_i_3
       (.I0(out_carry__0_n_3),
        .O(out__24_carry__0_i_3_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    out__24_carry__0_i_4
       (.I0(out_carry__0_n_3),
        .O(out__24_carry__0_i_4_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    out__24_carry__0_i_5
       (.I0(out_carry__0_n_3),
        .O(out__24_carry__0_i_5_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    out__24_carry__0_i_6
       (.I0(out_carry__0_n_3),
        .O(out__24_carry__0_i_6_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    out__24_carry__0_i_7
       (.I0(out_carry__0_n_3),
        .O(out__24_carry__0_i_7_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    out__24_carry__0_i_8
       (.I0(out_carry__0_n_3),
        .O(out__24_carry__0_i_8_n_0));
  CARRY8 out__24_carry__1
       (.CI(out__24_carry__0_n_0),
        .CI_TOP(1'b0),
        .CO({NLW_out__24_carry__1_CO_UNCONNECTED[7:2],out__24_carry__1_n_6,NLW_out__24_carry__1_CO_UNCONNECTED[0]}),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,out_carry__0_n_3}),
        .O({NLW_out__24_carry__1_O_UNCONNECTED[7:1],out__24_carry__1_n_15}),
        .S({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b1,out__24_carry__1_i_1_n_0}));
  LUT1 #(
    .INIT(2'h1)) 
    out__24_carry__1_i_1
       (.I0(out_carry__0_n_3),
        .O(out__24_carry__1_i_1_n_0));
  (* OPT_MODIFIED = "POST_PROCESS_NETLIST" *) 
  CARRY8 out__57_carry
       (.CI(1'b0),
        .CI_TOP(1'b0),
        .CO({out__57_carry_n_0,NLW_out__57_carry_CO_UNCONNECTED[6:0]}),
        .DI({out__24_carry_n_8,out__24_carry_n_9,out__24_carry_n_10,out__24_carry_n_11,out__24_carry_n_12,out__24_carry_n_13,out__24_carry_n_14,1'b0}),
        .O({out__57_carry_n_8,out__57_carry_n_9,out__57_carry_n_10,out__57_carry_n_11,out__57_carry_n_12,out__57_carry_n_13,out__57_carry_n_14,NLW_out__57_carry_O_UNCONNECTED[0]}),
        .S({out__24_carry_n_8,out__24_carry_n_9,out__24_carry_n_10,out__24_carry_n_11,out__24_carry_n_12,out__24_carry_n_13,out__24_carry_n_14,1'b0}));
  (* OPT_MODIFIED = "POST_PROCESS_NETLIST" *) 
  CARRY8 out__57_carry__0
       (.CI(out__57_carry_n_0),
        .CI_TOP(1'b0),
        .CO({out__57_carry__0_n_0,NLW_out__57_carry__0_CO_UNCONNECTED[6:0]}),
        .DI({out__24_carry__0_n_8,out__24_carry__0_n_9,out__24_carry__0_n_10,out__24_carry__0_n_11,out__24_carry__0_n_12,out__24_carry__0_n_13,out__24_carry__0_n_14,out__24_carry__0_n_15}),
        .O({out__57_carry__0_n_8,out__57_carry__0_n_9,out__57_carry__0_n_10,out__57_carry__0_n_11,out__57_carry__0_n_12,out__57_carry__0_n_13,out__57_carry__0_n_14,out__57_carry__0_n_15}),
        .S({out__24_carry__0_n_8,out__24_carry__0_n_9,out__24_carry__0_n_10,out__24_carry__0_n_11,out__24_carry__0_n_12,out__24_carry__0_n_13,out__24_carry__0_n_14,out__24_carry__0_n_15}));
  (* OPT_MODIFIED = "POST_PROCESS_NETLIST" *) 
  CARRY8 out__57_carry__1
       (.CI(out__57_carry__0_n_0),
        .CI_TOP(1'b0),
        .CO({NLW_out__57_carry__1_CO_UNCONNECTED[7:4],out__57_carry__1_n_4,NLW_out__57_carry__1_CO_UNCONNECTED[2:0]}),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,out__24_carry__1_n_6,out__57_carry__1_i_1_n_0,out__24_carry__1_n_15}),
        .O({NLW_out__57_carry__1_O_UNCONNECTED[7:3],out__57_carry__1_n_13,out__57_carry__1_n_14,out__57_carry__1_n_15}),
        .S({1'b0,1'b0,1'b0,1'b0,1'b1,out__57_carry__1_i_2_n_0,out__57_carry__1_i_3_n_0,out__24_carry__1_n_15}));
  LUT1 #(
    .INIT(2'h1)) 
    out__57_carry__1_i_1
       (.I0(out__24_carry__1_n_6),
        .O(out__57_carry__1_i_1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    out__57_carry__1_i_2
       (.I0(out__24_carry__1_n_6),
        .O(out__57_carry__1_i_2_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    out__57_carry__1_i_3
       (.I0(out__24_carry__1_n_6),
        .O(out__57_carry__1_i_3_n_0));
  (* OPT_MODIFIED = "POST_PROCESS_NETLIST" *) 
  CARRY8 out__94_carry
       (.CI(1'b0),
        .CI_TOP(1'b0),
        .CO({out__94_carry_n_0,NLW_out__94_carry_CO_UNCONNECTED[6:0]}),
        .DI({out__57_carry_n_8,out__57_carry_n_9,out__57_carry_n_10,out__57_carry_n_11,out__57_carry_n_12,out__57_carry_n_13,out__57_carry_n_14,1'b0}),
        .O({I56[6:0],NLW_out__94_carry_O_UNCONNECTED[0]}),
        .S({out__57_carry_n_8,out__57_carry_n_9,out__57_carry_n_10,out__57_carry_n_11,out__57_carry_n_12,out__57_carry_n_13,out__57_carry_n_14,1'b0}));
  (* OPT_MODIFIED = "POST_PROCESS_NETLIST" *) 
  CARRY8 out__94_carry__0
       (.CI(out__94_carry_n_0),
        .CI_TOP(1'b0),
        .CO({out__94_carry__0_n_0,NLW_out__94_carry__0_CO_UNCONNECTED[6:0]}),
        .DI({out__57_carry__0_n_8,out__57_carry__0_n_9,out__57_carry__0_n_10,out__57_carry__0_n_11,out__57_carry__0_n_12,out__57_carry__0_n_13,out__57_carry__0_n_14,out__57_carry__0_n_15}),
        .O(I56[14:7]),
        .S({out__57_carry__0_n_8,out__57_carry__0_n_9,out__57_carry__0_n_10,out__57_carry__0_n_11,out__57_carry__0_n_12,out__57_carry__0_n_13,out__57_carry__0_n_14,out__57_carry__0_n_15}));
  (* OPT_MODIFIED = "POST_PROCESS_NETLIST" *) 
  CARRY8 out__94_carry__1
       (.CI(out__94_carry__0_n_0),
        .CI_TOP(1'b0),
        .CO(NLW_out__94_carry__1_CO_UNCONNECTED[7:0]),
        .DI({1'b0,1'b0,1'b0,out__57_carry__1_n_4,out__94_carry__1_i_1_n_0,out__57_carry__1_n_13,out__57_carry__1_n_14,out__57_carry__1_n_15}),
        .O({NLW_out__94_carry__1_O_UNCONNECTED[7:6],I56[20:15]}),
        .S({1'b0,1'b0,1'b1,out__94_carry__1_i_2_n_0,out__94_carry__1_i_3_n_0,out__57_carry__1_n_13,out__57_carry__1_n_14,out__57_carry__1_n_15}));
  LUT1 #(
    .INIT(2'h1)) 
    out__94_carry__1_i_1
       (.I0(out__57_carry__1_n_4),
        .O(out__94_carry__1_i_1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    out__94_carry__1_i_2
       (.I0(out__57_carry__1_n_4),
        .O(out__94_carry__1_i_2_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    out__94_carry__1_i_3
       (.I0(out__57_carry__1_n_4),
        .O(out__94_carry__1_i_3_n_0));
  (* OPT_MODIFIED = "POST_PROCESS_NETLIST" *) 
  CARRY8 out_carry
       (.CI(1'b0),
        .CI_TOP(1'b0),
        .CO({out_carry_n_0,NLW_out_carry_CO_UNCONNECTED[6:0]}),
        .DI({O[4:0],reg_out,1'b0}),
        .O({out_carry_n_8,out_carry_n_9,out_carry_n_10,out_carry_n_11,out_carry_n_12,out_carry_n_13,out_carry_n_14,NLW_out_carry_O_UNCONNECTED[0]}),
        .S({O[4:0],reg_out,1'b0}));
  (* OPT_MODIFIED = "POST_PROCESS_NETLIST" *) 
  CARRY8 out_carry__0
       (.CI(out_carry_n_0),
        .CI_TOP(1'b0),
        .CO({NLW_out_carry__0_CO_UNCONNECTED[7:5],out_carry__0_n_3,NLW_out_carry__0_CO_UNCONNECTED[3:0]}),
        .DI({1'b0,1'b0,1'b0,1'b0,O[7:6],1'b1,1'b0}),
        .O({NLW_out_carry__0_O_UNCONNECTED[7:4],out_carry__0_n_12,out_carry__0_n_13,out_carry__0_n_14,out_carry__0_n_15}),
        .S({1'b0,1'b0,1'b0,1'b1,S,O[6:5]}));
endmodule

module booth__012
   (CO,
    O,
    \reg_out_reg[7] ,
    DI,
    S,
    out_carry__0);
  output [0:0]CO;
  output [7:0]O;
  output [1:0]\reg_out_reg[7] ;
  input [6:0]DI;
  input [7:0]S;
  input [0:0]out_carry__0;

  wire [0:0]CO;
  wire [6:0]DI;
  wire [7:0]O;
  wire [7:0]S;
  wire [0:0]out_carry__0;
  wire [1:0]\reg_out_reg[7] ;
  wire [6:0]NLW_z__0_carry_CO_UNCONNECTED;

  LUT2 #(
    .INIT(4'h6)) 
    out_carry__0_i_1
       (.I0(O[7]),
        .I1(out_carry__0),
        .O(\reg_out_reg[7] [1]));
  LUT2 #(
    .INIT(4'h9)) 
    out_carry__0_i_2
       (.I0(O[6]),
        .I1(O[7]),
        .O(\reg_out_reg[7] [0]));
  (* OPT_MODIFIED = "POST_PROCESS_NETLIST" *) 
  CARRY8 z__0_carry
       (.CI(1'b0),
        .CI_TOP(1'b0),
        .CO({CO,NLW_z__0_carry_CO_UNCONNECTED[6:0]}),
        .DI({DI,1'b0}),
        .O(O),
        .S(S));
endmodule

module demultiplexer_1d
   (\z[0] ,
    x,
    CLK);
  output [7:0]\z[0] ;
  input [7:0]x;
  input CLK;

  wire CLK;
  wire [2:2]sel;
  wire [7:0]x;
  wire z;
  wire [7:0]\z[0] ;

  LUT1 #(
    .INIT(2'h1)) 
    \genblk1[0].z[0][7]_i_1 
       (.I0(sel),
        .O(z));
  FDRE \genblk1[0].z_reg[0][0] 
       (.C(CLK),
        .CE(z),
        .D(x[0]),
        .Q(\z[0] [0]),
        .R(1'b0));
  FDRE \genblk1[0].z_reg[0][1] 
       (.C(CLK),
        .CE(z),
        .D(x[1]),
        .Q(\z[0] [1]),
        .R(1'b0));
  FDRE \genblk1[0].z_reg[0][2] 
       (.C(CLK),
        .CE(z),
        .D(x[2]),
        .Q(\z[0] [2]),
        .R(1'b0));
  FDRE \genblk1[0].z_reg[0][3] 
       (.C(CLK),
        .CE(z),
        .D(x[3]),
        .Q(\z[0] [3]),
        .R(1'b0));
  FDRE \genblk1[0].z_reg[0][4] 
       (.C(CLK),
        .CE(z),
        .D(x[4]),
        .Q(\z[0] [4]),
        .R(1'b0));
  FDRE \genblk1[0].z_reg[0][5] 
       (.C(CLK),
        .CE(z),
        .D(x[5]),
        .Q(\z[0] [5]),
        .R(1'b0));
  FDRE \genblk1[0].z_reg[0][6] 
       (.C(CLK),
        .CE(z),
        .D(x[6]),
        .Q(\z[0] [6]),
        .R(1'b0));
  FDRE \genblk1[0].z_reg[0][7] 
       (.C(CLK),
        .CE(z),
        .D(x[7]),
        .Q(\z[0] [7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sel_reg[2] 
       (.C(CLK),
        .CE(1'b1),
        .D(1'b1),
        .Q(sel),
        .R(1'b0));
endmodule

module layer
   (CO,
    I56,
    reg_out,
    DI,
    S,
    out_carry__0);
  output [0:0]CO;
  output [20:0]I56;
  input [3:0]reg_out;
  input [4:0]DI;
  input [7:0]S;
  input [0:0]out_carry__0;

  wire [0:0]CO;
  wire [4:0]DI;
  wire [20:0]I56;
  wire [7:0]S;
  wire mul00_n_10;
  wire mul00_n_9;
  wire [0:0]out_carry__0;
  wire [3:0]reg_out;
  wire [11:4]\tmp00[0]_0 ;

  add2__parameterized5 add000116
       (.I56(I56),
        .O(\tmp00[0]_0 ),
        .S({mul00_n_9,mul00_n_10}),
        .reg_out(reg_out[1:0]));
  booth__012 mul00
       (.CO(CO),
        .DI({reg_out[3:2],DI}),
        .O(\tmp00[0]_0 ),
        .S(S),
        .out_carry__0(out_carry__0),
        .\reg_out_reg[7] ({mul00_n_9,mul00_n_10}));
endmodule

module register_n
   (S,
    Q,
    \reg_out_reg[7]_0 ,
    DI,
    CO,
    E,
    D,
    CLK);
  output [7:0]S;
  output [3:0]Q;
  output [0:0]\reg_out_reg[7]_0 ;
  output [4:0]DI;
  input [0:0]CO;
  input [0:0]E;
  input [7:0]D;
  input CLK;

  wire CLK;
  wire [0:0]CO;
  wire [7:0]D;
  wire [4:0]DI;
  wire [0:0]E;
  wire [3:0]Q;
  wire [7:0]S;
  wire [0:0]\reg_out_reg[7]_0 ;
  wire [5:2]\x_reg[0] ;
  wire [7:1]NLW_out_carry__0_i_3_CO_UNCONNECTED;
  wire [7:0]NLW_out_carry__0_i_3_O_UNCONNECTED;

  CARRY8 out_carry__0_i_3
       (.CI(CO),
        .CI_TOP(1'b0),
        .CO({NLW_out_carry__0_i_3_CO_UNCONNECTED[7:1],\reg_out_reg[7]_0 }),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_out_carry__0_i_3_O_UNCONNECTED[7:0]),
        .S({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b1}));
  FDRE \reg_out_reg[0] 
       (.C(CLK),
        .CE(E),
        .D(D[0]),
        .Q(Q[0]),
        .R(1'b0));
  FDRE \reg_out_reg[1] 
       (.C(CLK),
        .CE(E),
        .D(D[1]),
        .Q(Q[1]),
        .R(1'b0));
  FDRE \reg_out_reg[2] 
       (.C(CLK),
        .CE(E),
        .D(D[2]),
        .Q(\x_reg[0] [2]),
        .R(1'b0));
  FDRE \reg_out_reg[3] 
       (.C(CLK),
        .CE(E),
        .D(D[3]),
        .Q(\x_reg[0] [3]),
        .R(1'b0));
  FDRE \reg_out_reg[4] 
       (.C(CLK),
        .CE(E),
        .D(D[4]),
        .Q(\x_reg[0] [4]),
        .R(1'b0));
  FDRE \reg_out_reg[5] 
       (.C(CLK),
        .CE(E),
        .D(D[5]),
        .Q(\x_reg[0] [5]),
        .R(1'b0));
  FDRE \reg_out_reg[6] 
       (.C(CLK),
        .CE(E),
        .D(D[6]),
        .Q(Q[2]),
        .R(1'b0));
  FDRE \reg_out_reg[7] 
       (.C(CLK),
        .CE(E),
        .D(D[7]),
        .Q(Q[3]),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h9)) 
    z__0_carry_i_1
       (.I0(Q[3]),
        .I1(\x_reg[0] [5]),
        .O(DI[4]));
  LUT4 #(
    .INIT(16'hB44B)) 
    z__0_carry_i_10
       (.I0(\x_reg[0] [2]),
        .I1(\x_reg[0] [4]),
        .I2(\x_reg[0] [3]),
        .I3(\x_reg[0] [5]),
        .O(S[3]));
  LUT4 #(
    .INIT(16'hB44B)) 
    z__0_carry_i_11
       (.I0(Q[1]),
        .I1(\x_reg[0] [3]),
        .I2(\x_reg[0] [2]),
        .I3(\x_reg[0] [4]),
        .O(S[2]));
  LUT4 #(
    .INIT(16'h2DD2)) 
    z__0_carry_i_12
       (.I0(Q[0]),
        .I1(\x_reg[0] [2]),
        .I2(Q[1]),
        .I3(\x_reg[0] [3]),
        .O(S[1]));
  LUT2 #(
    .INIT(4'h6)) 
    z__0_carry_i_13
       (.I0(\x_reg[0] [2]),
        .I1(Q[0]),
        .O(S[0]));
  LUT2 #(
    .INIT(4'h2)) 
    z__0_carry_i_2
       (.I0(\x_reg[0] [5]),
        .I1(\x_reg[0] [3]),
        .O(DI[3]));
  LUT2 #(
    .INIT(4'h2)) 
    z__0_carry_i_3
       (.I0(\x_reg[0] [4]),
        .I1(\x_reg[0] [2]),
        .O(DI[2]));
  LUT2 #(
    .INIT(4'h2)) 
    z__0_carry_i_4
       (.I0(\x_reg[0] [3]),
        .I1(Q[1]),
        .O(DI[1]));
  LUT2 #(
    .INIT(4'hB)) 
    z__0_carry_i_5
       (.I0(\x_reg[0] [2]),
        .I1(Q[0]),
        .O(DI[0]));
  LUT2 #(
    .INIT(4'h9)) 
    z__0_carry_i_6
       (.I0(Q[2]),
        .I1(Q[3]),
        .O(S[7]));
  LUT3 #(
    .INIT(8'h87)) 
    z__0_carry_i_7
       (.I0(Q[3]),
        .I1(\x_reg[0] [5]),
        .I2(Q[2]),
        .O(S[6]));
  LUT4 #(
    .INIT(16'h9699)) 
    z__0_carry_i_8
       (.I0(\x_reg[0] [5]),
        .I1(Q[3]),
        .I2(\x_reg[0] [4]),
        .I3(Q[2]),
        .O(S[5]));
  LUT4 #(
    .INIT(16'hB44B)) 
    z__0_carry_i_9
       (.I0(\x_reg[0] [3]),
        .I1(\x_reg[0] [5]),
        .I2(\x_reg[0] [4]),
        .I3(Q[2]),
        .O(S[4]));
endmodule

(* ORIG_REF_NAME = "register_n" *) 
module register_n__parameterized0
   (Q,
    E,
    D,
    CLK);
  output [20:0]Q;
  input [0:0]E;
  input [20:0]D;
  input CLK;

  wire CLK;
  wire [20:0]D;
  wire [0:0]E;
  wire [20:0]Q;

  FDRE \reg_out_reg[10] 
       (.C(CLK),
        .CE(E),
        .D(D[8]),
        .Q(Q[8]),
        .R(1'b0));
  FDRE \reg_out_reg[11] 
       (.C(CLK),
        .CE(E),
        .D(D[9]),
        .Q(Q[9]),
        .R(1'b0));
  FDRE \reg_out_reg[12] 
       (.C(CLK),
        .CE(E),
        .D(D[10]),
        .Q(Q[10]),
        .R(1'b0));
  FDRE \reg_out_reg[13] 
       (.C(CLK),
        .CE(E),
        .D(D[11]),
        .Q(Q[11]),
        .R(1'b0));
  FDRE \reg_out_reg[14] 
       (.C(CLK),
        .CE(E),
        .D(D[12]),
        .Q(Q[12]),
        .R(1'b0));
  FDRE \reg_out_reg[15] 
       (.C(CLK),
        .CE(E),
        .D(D[13]),
        .Q(Q[13]),
        .R(1'b0));
  FDRE \reg_out_reg[16] 
       (.C(CLK),
        .CE(E),
        .D(D[14]),
        .Q(Q[14]),
        .R(1'b0));
  FDRE \reg_out_reg[17] 
       (.C(CLK),
        .CE(E),
        .D(D[15]),
        .Q(Q[15]),
        .R(1'b0));
  FDRE \reg_out_reg[18] 
       (.C(CLK),
        .CE(E),
        .D(D[16]),
        .Q(Q[16]),
        .R(1'b0));
  FDRE \reg_out_reg[19] 
       (.C(CLK),
        .CE(E),
        .D(D[17]),
        .Q(Q[17]),
        .R(1'b0));
  FDRE \reg_out_reg[20] 
       (.C(CLK),
        .CE(E),
        .D(D[18]),
        .Q(Q[18]),
        .R(1'b0));
  FDRE \reg_out_reg[21] 
       (.C(CLK),
        .CE(E),
        .D(D[19]),
        .Q(Q[19]),
        .R(1'b0));
  FDRE \reg_out_reg[22] 
       (.C(CLK),
        .CE(E),
        .D(D[20]),
        .Q(Q[20]),
        .R(1'b0));
  FDRE \reg_out_reg[2] 
       (.C(CLK),
        .CE(E),
        .D(D[0]),
        .Q(Q[0]),
        .R(1'b0));
  FDRE \reg_out_reg[3] 
       (.C(CLK),
        .CE(E),
        .D(D[1]),
        .Q(Q[1]),
        .R(1'b0));
  FDRE \reg_out_reg[4] 
       (.C(CLK),
        .CE(E),
        .D(D[2]),
        .Q(Q[2]),
        .R(1'b0));
  FDRE \reg_out_reg[5] 
       (.C(CLK),
        .CE(E),
        .D(D[3]),
        .Q(Q[3]),
        .R(1'b0));
  FDRE \reg_out_reg[6] 
       (.C(CLK),
        .CE(E),
        .D(D[4]),
        .Q(Q[4]),
        .R(1'b0));
  FDRE \reg_out_reg[7] 
       (.C(CLK),
        .CE(E),
        .D(D[5]),
        .Q(Q[5]),
        .R(1'b0));
  FDRE \reg_out_reg[8] 
       (.C(CLK),
        .CE(E),
        .D(D[6]),
        .Q(Q[6]),
        .R(1'b0));
  FDRE \reg_out_reg[9] 
       (.C(CLK),
        .CE(E),
        .D(D[7]),
        .Q(Q[7]),
        .R(1'b0));
endmodule

(* ECO_CHECKSUM = "3433aa2" *) (* WIDTH = "8" *) 
(* NotValidForBitStream *)
module top
   (x,
    z,
    clk,
    ctrl,
    en);
  input [7:0]x;
  output [22:0]z;
  input clk;
  input ctrl;
  input en;

  wire clk;
  wire clk_IBUF;
  wire clk_IBUF_BUFG;
  wire conv_n_0;
  wire ctrl;
  wire ctrl_IBUF;
  wire \genblk1[0].reg_in_n_0 ;
  wire \genblk1[0].reg_in_n_1 ;
  wire \genblk1[0].reg_in_n_12 ;
  wire \genblk1[0].reg_in_n_13 ;
  wire \genblk1[0].reg_in_n_14 ;
  wire \genblk1[0].reg_in_n_15 ;
  wire \genblk1[0].reg_in_n_16 ;
  wire \genblk1[0].reg_in_n_17 ;
  wire \genblk1[0].reg_in_n_2 ;
  wire \genblk1[0].reg_in_n_3 ;
  wire \genblk1[0].reg_in_n_4 ;
  wire \genblk1[0].reg_in_n_5 ;
  wire \genblk1[0].reg_in_n_6 ;
  wire \genblk1[0].reg_in_n_7 ;
  wire [7:0]x;
  wire [7:0]x_IBUF;
  wire [7:0]\x_demux[0] ;
  wire [7:0]\x_reg[0] ;
  wire [22:0]z;
  wire [22:2]z_OBUF;
  wire [22:2]z_reg;

initial begin
 $sdf_annotate("top-netlist.sdf",,,,"tool_control");
end
  (* XILINX_LEGACY_PRIM = "BUFG" *) 
  BUFGCE #(
    .CE_TYPE("ASYNC"),
    .SIM_DEVICE("ULTRASCALE_PLUS")) 
    clk_IBUF_BUFG_inst
       (.CE(1'b1),
        .I(clk_IBUF),
        .O(clk_IBUF_BUFG));
  IBUF_UNIQ_BASE_ clk_IBUF_inst
       (.I(clk),
        .O(clk_IBUF));
  layer conv
       (.CO(conv_n_0),
        .DI({\genblk1[0].reg_in_n_13 ,\genblk1[0].reg_in_n_14 ,\genblk1[0].reg_in_n_15 ,\genblk1[0].reg_in_n_16 ,\genblk1[0].reg_in_n_17 }),
        .I56(z_reg),
        .S({\genblk1[0].reg_in_n_0 ,\genblk1[0].reg_in_n_1 ,\genblk1[0].reg_in_n_2 ,\genblk1[0].reg_in_n_3 ,\genblk1[0].reg_in_n_4 ,\genblk1[0].reg_in_n_5 ,\genblk1[0].reg_in_n_6 ,\genblk1[0].reg_in_n_7 }),
        .out_carry__0(\genblk1[0].reg_in_n_12 ),
        .reg_out({\x_reg[0] [7:6],\x_reg[0] [1:0]}));
  IBUF_HD1 ctrl_IBUF_inst
       (.I(ctrl),
        .O(ctrl_IBUF));
  demultiplexer_1d demux
       (.CLK(clk_IBUF_BUFG),
        .x(x_IBUF),
        .\z[0] (\x_demux[0] ));
  register_n \genblk1[0].reg_in 
       (.CLK(clk_IBUF_BUFG),
        .CO(conv_n_0),
        .D(\x_demux[0] ),
        .DI({\genblk1[0].reg_in_n_13 ,\genblk1[0].reg_in_n_14 ,\genblk1[0].reg_in_n_15 ,\genblk1[0].reg_in_n_16 ,\genblk1[0].reg_in_n_17 }),
        .E(ctrl_IBUF),
        .Q({\x_reg[0] [7:6],\x_reg[0] [1:0]}),
        .S({\genblk1[0].reg_in_n_0 ,\genblk1[0].reg_in_n_1 ,\genblk1[0].reg_in_n_2 ,\genblk1[0].reg_in_n_3 ,\genblk1[0].reg_in_n_4 ,\genblk1[0].reg_in_n_5 ,\genblk1[0].reg_in_n_6 ,\genblk1[0].reg_in_n_7 }),
        .\reg_out_reg[7]_0 (\genblk1[0].reg_in_n_12 ));
  register_n__parameterized0 reg_out
       (.CLK(clk_IBUF_BUFG),
        .D(z_reg),
        .E(ctrl_IBUF),
        .Q(z_OBUF));
  IBUF_HD2 \x_IBUF[0]_inst 
       (.I(x[0]),
        .O(x_IBUF[0]));
  IBUF_HD3 \x_IBUF[1]_inst 
       (.I(x[1]),
        .O(x_IBUF[1]));
  IBUF_HD4 \x_IBUF[2]_inst 
       (.I(x[2]),
        .O(x_IBUF[2]));
  IBUF_HD5 \x_IBUF[3]_inst 
       (.I(x[3]),
        .O(x_IBUF[3]));
  IBUF_HD6 \x_IBUF[4]_inst 
       (.I(x[4]),
        .O(x_IBUF[4]));
  IBUF_HD7 \x_IBUF[5]_inst 
       (.I(x[5]),
        .O(x_IBUF[5]));
  IBUF_HD8 \x_IBUF[6]_inst 
       (.I(x[6]),
        .O(x_IBUF[6]));
  IBUF_HD9 \x_IBUF[7]_inst 
       (.I(x[7]),
        .O(x_IBUF[7]));
  OBUF \z_OBUF[0]_inst 
       (.I(1'b0),
        .O(z[0]));
  OBUF \z_OBUF[10]_inst 
       (.I(z_OBUF[10]),
        .O(z[10]));
  OBUF \z_OBUF[11]_inst 
       (.I(z_OBUF[11]),
        .O(z[11]));
  OBUF \z_OBUF[12]_inst 
       (.I(z_OBUF[12]),
        .O(z[12]));
  OBUF \z_OBUF[13]_inst 
       (.I(z_OBUF[13]),
        .O(z[13]));
  OBUF \z_OBUF[14]_inst 
       (.I(z_OBUF[14]),
        .O(z[14]));
  OBUF \z_OBUF[15]_inst 
       (.I(z_OBUF[15]),
        .O(z[15]));
  OBUF \z_OBUF[16]_inst 
       (.I(z_OBUF[16]),
        .O(z[16]));
  OBUF \z_OBUF[17]_inst 
       (.I(z_OBUF[17]),
        .O(z[17]));
  OBUF \z_OBUF[18]_inst 
       (.I(z_OBUF[18]),
        .O(z[18]));
  OBUF \z_OBUF[19]_inst 
       (.I(z_OBUF[19]),
        .O(z[19]));
  OBUF \z_OBUF[1]_inst 
       (.I(1'b0),
        .O(z[1]));
  OBUF \z_OBUF[20]_inst 
       (.I(z_OBUF[20]),
        .O(z[20]));
  OBUF \z_OBUF[21]_inst 
       (.I(z_OBUF[21]),
        .O(z[21]));
  OBUF \z_OBUF[22]_inst 
       (.I(z_OBUF[22]),
        .O(z[22]));
  OBUF \z_OBUF[2]_inst 
       (.I(z_OBUF[2]),
        .O(z[2]));
  OBUF \z_OBUF[3]_inst 
       (.I(z_OBUF[3]),
        .O(z[3]));
  OBUF \z_OBUF[4]_inst 
       (.I(z_OBUF[4]),
        .O(z[4]));
  OBUF \z_OBUF[5]_inst 
       (.I(z_OBUF[5]),
        .O(z[5]));
  OBUF \z_OBUF[6]_inst 
       (.I(z_OBUF[6]),
        .O(z[6]));
  OBUF \z_OBUF[7]_inst 
       (.I(z_OBUF[7]),
        .O(z[7]));
  OBUF \z_OBUF[8]_inst 
       (.I(z_OBUF[8]),
        .O(z[8]));
  OBUF \z_OBUF[9]_inst 
       (.I(z_OBUF[9]),
        .O(z[9]));
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

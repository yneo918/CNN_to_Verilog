// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.1 (lin64) Build 2902540 Wed May 27 19:54:35 MDT 2020
// Date        : Sat Mar 12 00:05:55 2022
// Host        : lepus running 64-bit CentOS Linux release 7.9.2009 (Core)
// Command     : write_verilog -force ./output/conv2_2/export/top-netlist.v -mode timesim -sdf_anno true
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
   (z,
    reg_out);
  output [19:0]z;
  input [7:0]reg_out;

  wire out__16_carry__0_i_10_n_0;
  wire out__16_carry__0_i_11_n_0;
  wire out__16_carry__0_i_1_n_0;
  wire out__16_carry__0_i_2_n_0;
  wire out__16_carry__0_i_3_n_0;
  wire out__16_carry__0_i_4_n_0;
  wire out__16_carry__0_i_5_n_0;
  wire out__16_carry__0_i_6_n_0;
  wire out__16_carry__0_i_7_n_0;
  wire out__16_carry__0_i_8_n_0;
  wire out__16_carry__0_i_9_n_0;
  wire out__16_carry__0_n_0;
  wire out__16_carry__0_n_10;
  wire out__16_carry__0_n_11;
  wire out__16_carry__0_n_12;
  wire out__16_carry__0_n_13;
  wire out__16_carry__0_n_14;
  wire out__16_carry__0_n_15;
  wire out__16_carry__0_n_9;
  wire out__16_carry_n_0;
  wire out__16_carry_n_10;
  wire out__16_carry_n_11;
  wire out__16_carry_n_12;
  wire out__16_carry_n_13;
  wire out__16_carry_n_14;
  wire out__16_carry_n_8;
  wire out__16_carry_n_9;
  wire out__45_carry__0_i_1_n_0;
  wire out__45_carry__0_i_2_n_0;
  wire out__45_carry__0_n_0;
  wire out__45_carry__0_n_10;
  wire out__45_carry__0_n_11;
  wire out__45_carry__0_n_12;
  wire out__45_carry__0_n_13;
  wire out__45_carry__0_n_14;
  wire out__45_carry__0_n_15;
  wire out__45_carry__0_n_8;
  wire out__45_carry__0_n_9;
  wire out__45_carry__1_i_1_n_0;
  wire out__45_carry__1_i_2_n_0;
  wire out__45_carry__1_i_3_n_0;
  wire out__45_carry__1_n_14;
  wire out__45_carry__1_n_15;
  wire out__45_carry__1_n_5;
  wire out__45_carry_n_0;
  wire out__45_carry_n_10;
  wire out__45_carry_n_11;
  wire out__45_carry_n_12;
  wire out__45_carry_n_13;
  wire out__45_carry_n_14;
  wire out__45_carry_n_8;
  wire out__45_carry_n_9;
  wire out__80_carry__0_n_0;
  wire out__80_carry__1_i_1_n_0;
  wire out__80_carry__1_i_2_n_0;
  wire out__80_carry__1_i_3_n_0;
  wire out__80_carry_n_0;
  wire out_carry__0_n_15;
  wire out_carry__0_n_6;
  wire out_carry_n_0;
  wire out_carry_n_10;
  wire out_carry_n_11;
  wire out_carry_n_12;
  wire out_carry_n_13;
  wire out_carry_n_14;
  wire out_carry_n_8;
  wire out_carry_n_9;
  wire [7:0]reg_out;
  wire [19:0]z;
  wire [6:0]NLW_out__16_carry_CO_UNCONNECTED;
  wire [0:0]NLW_out__16_carry_O_UNCONNECTED;
  wire [6:0]NLW_out__16_carry__0_CO_UNCONNECTED;
  wire [7:7]NLW_out__16_carry__0_O_UNCONNECTED;
  wire [6:0]NLW_out__45_carry_CO_UNCONNECTED;
  wire [0:0]NLW_out__45_carry_O_UNCONNECTED;
  wire [6:0]NLW_out__45_carry__0_CO_UNCONNECTED;
  wire [7:0]NLW_out__45_carry__1_CO_UNCONNECTED;
  wire [7:2]NLW_out__45_carry__1_O_UNCONNECTED;
  wire [6:0]NLW_out__80_carry_CO_UNCONNECTED;
  wire [0:0]NLW_out__80_carry_O_UNCONNECTED;
  wire [6:0]NLW_out__80_carry__0_CO_UNCONNECTED;
  wire [7:0]NLW_out__80_carry__1_CO_UNCONNECTED;
  wire [7:5]NLW_out__80_carry__1_O_UNCONNECTED;
  wire [6:0]NLW_out_carry_CO_UNCONNECTED;
  wire [0:0]NLW_out_carry_O_UNCONNECTED;
  wire [7:0]NLW_out_carry__0_CO_UNCONNECTED;
  wire [7:1]NLW_out_carry__0_O_UNCONNECTED;

  (* OPT_MODIFIED = "POST_PROCESS_NETLIST" *) 
  CARRY8 out__16_carry
       (.CI(1'b0),
        .CI_TOP(1'b0),
        .CO({out__16_carry_n_0,NLW_out__16_carry_CO_UNCONNECTED[6:0]}),
        .DI({out_carry_n_8,out_carry_n_9,out_carry_n_10,out_carry_n_11,out_carry_n_12,out_carry_n_13,out_carry_n_14,1'b0}),
        .O({out__16_carry_n_8,out__16_carry_n_9,out__16_carry_n_10,out__16_carry_n_11,out__16_carry_n_12,out__16_carry_n_13,out__16_carry_n_14,NLW_out__16_carry_O_UNCONNECTED[0]}),
        .S({out_carry_n_8,out_carry_n_9,out_carry_n_10,out_carry_n_11,out_carry_n_12,out_carry_n_13,out_carry_n_14,1'b0}));
  (* OPT_MODIFIED = "POST_PROCESS_NETLIST" *) 
  CARRY8 out__16_carry__0
       (.CI(out__16_carry_n_0),
        .CI_TOP(1'b0),
        .CO({out__16_carry__0_n_0,NLW_out__16_carry__0_CO_UNCONNECTED[6:0]}),
        .DI({1'b0,out_carry__0_n_6,out__16_carry__0_i_1_n_0,out__16_carry__0_i_2_n_0,out__16_carry__0_i_3_n_0,out__16_carry__0_i_4_n_0,out__16_carry__0_i_5_n_0,out_carry__0_n_15}),
        .O({NLW_out__16_carry__0_O_UNCONNECTED[7],out__16_carry__0_n_9,out__16_carry__0_n_10,out__16_carry__0_n_11,out__16_carry__0_n_12,out__16_carry__0_n_13,out__16_carry__0_n_14,out__16_carry__0_n_15}),
        .S({1'b1,out__16_carry__0_i_6_n_0,out__16_carry__0_i_7_n_0,out__16_carry__0_i_8_n_0,out__16_carry__0_i_9_n_0,out__16_carry__0_i_10_n_0,out__16_carry__0_i_11_n_0,out_carry__0_n_15}));
  LUT1 #(
    .INIT(2'h1)) 
    out__16_carry__0_i_1
       (.I0(out_carry__0_n_6),
        .O(out__16_carry__0_i_1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    out__16_carry__0_i_10
       (.I0(out_carry__0_n_6),
        .O(out__16_carry__0_i_10_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    out__16_carry__0_i_11
       (.I0(out_carry__0_n_6),
        .O(out__16_carry__0_i_11_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    out__16_carry__0_i_2
       (.I0(out_carry__0_n_6),
        .O(out__16_carry__0_i_2_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    out__16_carry__0_i_3
       (.I0(out_carry__0_n_6),
        .O(out__16_carry__0_i_3_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    out__16_carry__0_i_4
       (.I0(out_carry__0_n_6),
        .O(out__16_carry__0_i_4_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    out__16_carry__0_i_5
       (.I0(out_carry__0_n_6),
        .O(out__16_carry__0_i_5_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    out__16_carry__0_i_6
       (.I0(out_carry__0_n_6),
        .O(out__16_carry__0_i_6_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    out__16_carry__0_i_7
       (.I0(out_carry__0_n_6),
        .O(out__16_carry__0_i_7_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    out__16_carry__0_i_8
       (.I0(out_carry__0_n_6),
        .O(out__16_carry__0_i_8_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    out__16_carry__0_i_9
       (.I0(out_carry__0_n_6),
        .O(out__16_carry__0_i_9_n_0));
  (* OPT_MODIFIED = "POST_PROCESS_NETLIST" *) 
  CARRY8 out__45_carry
       (.CI(1'b0),
        .CI_TOP(1'b0),
        .CO({out__45_carry_n_0,NLW_out__45_carry_CO_UNCONNECTED[6:0]}),
        .DI({out__16_carry_n_8,out__16_carry_n_9,out__16_carry_n_10,out__16_carry_n_11,out__16_carry_n_12,out__16_carry_n_13,out__16_carry_n_14,1'b0}),
        .O({out__45_carry_n_8,out__45_carry_n_9,out__45_carry_n_10,out__45_carry_n_11,out__45_carry_n_12,out__45_carry_n_13,out__45_carry_n_14,NLW_out__45_carry_O_UNCONNECTED[0]}),
        .S({out__16_carry_n_8,out__16_carry_n_9,out__16_carry_n_10,out__16_carry_n_11,out__16_carry_n_12,out__16_carry_n_13,out__16_carry_n_14,1'b0}));
  (* OPT_MODIFIED = "POST_PROCESS_NETLIST" *) 
  CARRY8 out__45_carry__0
       (.CI(out__45_carry_n_0),
        .CI_TOP(1'b0),
        .CO({out__45_carry__0_n_0,NLW_out__45_carry__0_CO_UNCONNECTED[6:0]}),
        .DI({out__45_carry__0_i_1_n_0,out__16_carry__0_n_9,out__16_carry__0_n_10,out__16_carry__0_n_11,out__16_carry__0_n_12,out__16_carry__0_n_13,out__16_carry__0_n_14,out__16_carry__0_n_15}),
        .O({out__45_carry__0_n_8,out__45_carry__0_n_9,out__45_carry__0_n_10,out__45_carry__0_n_11,out__45_carry__0_n_12,out__45_carry__0_n_13,out__45_carry__0_n_14,out__45_carry__0_n_15}),
        .S({out__45_carry__0_i_2_n_0,out__16_carry__0_n_9,out__16_carry__0_n_10,out__16_carry__0_n_11,out__16_carry__0_n_12,out__16_carry__0_n_13,out__16_carry__0_n_14,out__16_carry__0_n_15}));
  LUT1 #(
    .INIT(2'h1)) 
    out__45_carry__0_i_1
       (.I0(out__16_carry__0_n_0),
        .O(out__45_carry__0_i_1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    out__45_carry__0_i_2
       (.I0(out__16_carry__0_n_0),
        .O(out__45_carry__0_i_2_n_0));
  (* OPT_MODIFIED = "POST_PROCESS_NETLIST" *) 
  CARRY8 out__45_carry__1
       (.CI(out__45_carry__0_n_0),
        .CI_TOP(1'b0),
        .CO({NLW_out__45_carry__1_CO_UNCONNECTED[7:3],out__45_carry__1_n_5,NLW_out__45_carry__1_CO_UNCONNECTED[1:0]}),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,out__16_carry__0_n_0,out__45_carry__1_i_1_n_0}),
        .O({NLW_out__45_carry__1_O_UNCONNECTED[7:2],out__45_carry__1_n_14,out__45_carry__1_n_15}),
        .S({1'b0,1'b0,1'b0,1'b0,1'b0,1'b1,out__45_carry__1_i_2_n_0,out__45_carry__1_i_3_n_0}));
  LUT1 #(
    .INIT(2'h1)) 
    out__45_carry__1_i_1
       (.I0(out__16_carry__0_n_0),
        .O(out__45_carry__1_i_1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    out__45_carry__1_i_2
       (.I0(out__16_carry__0_n_0),
        .O(out__45_carry__1_i_2_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    out__45_carry__1_i_3
       (.I0(out__16_carry__0_n_0),
        .O(out__45_carry__1_i_3_n_0));
  (* OPT_MODIFIED = "POST_PROCESS_NETLIST" *) 
  CARRY8 out__80_carry
       (.CI(1'b0),
        .CI_TOP(1'b0),
        .CO({out__80_carry_n_0,NLW_out__80_carry_CO_UNCONNECTED[6:0]}),
        .DI({out__45_carry_n_8,out__45_carry_n_9,out__45_carry_n_10,out__45_carry_n_11,out__45_carry_n_12,out__45_carry_n_13,out__45_carry_n_14,1'b0}),
        .O({z[6:0],NLW_out__80_carry_O_UNCONNECTED[0]}),
        .S({out__45_carry_n_8,out__45_carry_n_9,out__45_carry_n_10,out__45_carry_n_11,out__45_carry_n_12,out__45_carry_n_13,out__45_carry_n_14,1'b0}));
  (* OPT_MODIFIED = "POST_PROCESS_NETLIST" *) 
  CARRY8 out__80_carry__0
       (.CI(out__80_carry_n_0),
        .CI_TOP(1'b0),
        .CO({out__80_carry__0_n_0,NLW_out__80_carry__0_CO_UNCONNECTED[6:0]}),
        .DI({out__45_carry__0_n_8,out__45_carry__0_n_9,out__45_carry__0_n_10,out__45_carry__0_n_11,out__45_carry__0_n_12,out__45_carry__0_n_13,out__45_carry__0_n_14,out__45_carry__0_n_15}),
        .O(z[14:7]),
        .S({out__45_carry__0_n_8,out__45_carry__0_n_9,out__45_carry__0_n_10,out__45_carry__0_n_11,out__45_carry__0_n_12,out__45_carry__0_n_13,out__45_carry__0_n_14,out__45_carry__0_n_15}));
  (* OPT_MODIFIED = "POST_PROCESS_NETLIST" *) 
  CARRY8 out__80_carry__1
       (.CI(out__80_carry__0_n_0),
        .CI_TOP(1'b0),
        .CO(NLW_out__80_carry__1_CO_UNCONNECTED[7:0]),
        .DI({1'b0,1'b0,1'b0,1'b0,out__45_carry__1_n_5,out__80_carry__1_i_1_n_0,out__45_carry__1_n_14,out__45_carry__1_n_15}),
        .O({NLW_out__80_carry__1_O_UNCONNECTED[7:5],z[19:15]}),
        .S({1'b0,1'b0,1'b0,1'b1,out__80_carry__1_i_2_n_0,out__80_carry__1_i_3_n_0,out__45_carry__1_n_14,out__45_carry__1_n_15}));
  LUT1 #(
    .INIT(2'h1)) 
    out__80_carry__1_i_1
       (.I0(out__45_carry__1_n_5),
        .O(out__80_carry__1_i_1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    out__80_carry__1_i_2
       (.I0(out__45_carry__1_n_5),
        .O(out__80_carry__1_i_2_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    out__80_carry__1_i_3
       (.I0(out__45_carry__1_n_5),
        .O(out__80_carry__1_i_3_n_0));
  (* OPT_MODIFIED = "POST_PROCESS_NETLIST" *) 
  CARRY8 out_carry
       (.CI(1'b0),
        .CI_TOP(1'b0),
        .CO({out_carry_n_0,NLW_out_carry_CO_UNCONNECTED[6:0]}),
        .DI({reg_out[6:0],1'b0}),
        .O({out_carry_n_8,out_carry_n_9,out_carry_n_10,out_carry_n_11,out_carry_n_12,out_carry_n_13,out_carry_n_14,NLW_out_carry_O_UNCONNECTED[0]}),
        .S({reg_out[6:0],1'b0}));
  CARRY8 out_carry__0
       (.CI(out_carry_n_0),
        .CI_TOP(1'b0),
        .CO({NLW_out_carry__0_CO_UNCONNECTED[7:2],out_carry__0_n_6,NLW_out_carry__0_CO_UNCONNECTED[0]}),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b1}),
        .O({NLW_out_carry__0_O_UNCONNECTED[7:1],out_carry__0_n_15}),
        .S({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b1,reg_out[7]}));
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
   (z,
    reg_out);
  output [19:0]z;
  input [7:0]reg_out;

  wire [7:0]reg_out;
  wire [19:0]z;

  add2__parameterized5 add000105
       (.reg_out(reg_out),
        .z(z));
endmodule

module register_n
   (Q,
    E,
    D,
    CLK);
  output [7:0]Q;
  input [0:0]E;
  input [7:0]D;
  input CLK;

  wire CLK;
  wire [7:0]D;
  wire [0:0]E;
  wire [7:0]Q;

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
        .Q(Q[2]),
        .R(1'b0));
  FDRE \reg_out_reg[3] 
       (.C(CLK),
        .CE(E),
        .D(D[3]),
        .Q(Q[3]),
        .R(1'b0));
  FDRE \reg_out_reg[4] 
       (.C(CLK),
        .CE(E),
        .D(D[4]),
        .Q(Q[4]),
        .R(1'b0));
  FDRE \reg_out_reg[5] 
       (.C(CLK),
        .CE(E),
        .D(D[5]),
        .Q(Q[5]),
        .R(1'b0));
  FDRE \reg_out_reg[6] 
       (.C(CLK),
        .CE(E),
        .D(D[6]),
        .Q(Q[6]),
        .R(1'b0));
  FDRE \reg_out_reg[7] 
       (.C(CLK),
        .CE(E),
        .D(D[7]),
        .Q(Q[7]),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "register_n" *) 
module register_n__parameterized0
   (Q,
    E,
    D,
    CLK);
  output [19:0]Q;
  input [0:0]E;
  input [19:0]D;
  input CLK;

  wire CLK;
  wire [19:0]D;
  wire [0:0]E;
  wire [19:0]Q;

  FDRE \reg_out_reg[10] 
       (.C(CLK),
        .CE(E),
        .D(D[7]),
        .Q(Q[7]),
        .R(1'b0));
  FDRE \reg_out_reg[11] 
       (.C(CLK),
        .CE(E),
        .D(D[8]),
        .Q(Q[8]),
        .R(1'b0));
  FDRE \reg_out_reg[12] 
       (.C(CLK),
        .CE(E),
        .D(D[9]),
        .Q(Q[9]),
        .R(1'b0));
  FDRE \reg_out_reg[13] 
       (.C(CLK),
        .CE(E),
        .D(D[10]),
        .Q(Q[10]),
        .R(1'b0));
  FDRE \reg_out_reg[14] 
       (.C(CLK),
        .CE(E),
        .D(D[11]),
        .Q(Q[11]),
        .R(1'b0));
  FDRE \reg_out_reg[15] 
       (.C(CLK),
        .CE(E),
        .D(D[12]),
        .Q(Q[12]),
        .R(1'b0));
  FDRE \reg_out_reg[16] 
       (.C(CLK),
        .CE(E),
        .D(D[13]),
        .Q(Q[13]),
        .R(1'b0));
  FDRE \reg_out_reg[17] 
       (.C(CLK),
        .CE(E),
        .D(D[14]),
        .Q(Q[14]),
        .R(1'b0));
  FDRE \reg_out_reg[18] 
       (.C(CLK),
        .CE(E),
        .D(D[15]),
        .Q(Q[15]),
        .R(1'b0));
  FDRE \reg_out_reg[19] 
       (.C(CLK),
        .CE(E),
        .D(D[16]),
        .Q(Q[16]),
        .R(1'b0));
  FDRE \reg_out_reg[20] 
       (.C(CLK),
        .CE(E),
        .D(D[17]),
        .Q(Q[17]),
        .R(1'b0));
  FDRE \reg_out_reg[21] 
       (.C(CLK),
        .CE(E),
        .D(D[18]),
        .Q(Q[18]),
        .R(1'b0));
  FDRE \reg_out_reg[22] 
       (.C(CLK),
        .CE(E),
        .D(D[19]),
        .Q(Q[19]),
        .R(1'b0));
  FDRE \reg_out_reg[3] 
       (.C(CLK),
        .CE(E),
        .D(D[0]),
        .Q(Q[0]),
        .R(1'b0));
  FDRE \reg_out_reg[4] 
       (.C(CLK),
        .CE(E),
        .D(D[1]),
        .Q(Q[1]),
        .R(1'b0));
  FDRE \reg_out_reg[5] 
       (.C(CLK),
        .CE(E),
        .D(D[2]),
        .Q(Q[2]),
        .R(1'b0));
  FDRE \reg_out_reg[6] 
       (.C(CLK),
        .CE(E),
        .D(D[3]),
        .Q(Q[3]),
        .R(1'b0));
  FDRE \reg_out_reg[7] 
       (.C(CLK),
        .CE(E),
        .D(D[4]),
        .Q(Q[4]),
        .R(1'b0));
  FDRE \reg_out_reg[8] 
       (.C(CLK),
        .CE(E),
        .D(D[5]),
        .Q(Q[5]),
        .R(1'b0));
  FDRE \reg_out_reg[9] 
       (.C(CLK),
        .CE(E),
        .D(D[6]),
        .Q(Q[6]),
        .R(1'b0));
endmodule

(* ECO_CHECKSUM = "b3fd7534" *) (* WIDTH = "8" *) 
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
  wire ctrl;
  wire ctrl_IBUF;
  wire [7:0]x;
  wire [7:0]x_IBUF;
  wire [7:0]\x_demux[0] ;
  wire [7:0]\x_reg[0] ;
  wire [22:0]z;
  wire [22:3]z_OBUF;
  wire [22:3]z_reg;

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
       (.reg_out(\x_reg[0] ),
        .z(z_reg));
  IBUF_HD1 ctrl_IBUF_inst
       (.I(ctrl),
        .O(ctrl_IBUF));
  demultiplexer_1d demux
       (.CLK(clk_IBUF_BUFG),
        .x(x_IBUF),
        .\z[0] (\x_demux[0] ));
  register_n \genblk1[0].reg_in 
       (.CLK(clk_IBUF_BUFG),
        .D(\x_demux[0] ),
        .E(ctrl_IBUF),
        .Q(\x_reg[0] ));
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
       (.I(1'b0),
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

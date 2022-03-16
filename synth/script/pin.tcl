# CLOCK
if {[llength [get_ports "FPGA_EMCCLK" -quiet] ] !=0} {
    set_property -dict {PACKAGE_PIN K20 IOSTANDARD LVCMOS18} [get_ports "FPGA_EMCCLK" ]
}

#GPIO PUSH BUTTON
if {[llength [get_ports "GPIO_SW_N" -quiet] ] !=0} {
    set_property -dict {PACKAGE_PIN AD10 IOSTANDARD LVCMOS18} [get_ports "GPIO_SW_N" ]
}
if {[llength [get_ports "GPIO_SW_E" -quiet] ] !=0} {
    set_property -dict {PACKAGE_PIN AE8 IOSTANDARD LVCMOS18} [get_ports "GPIO_SW_E" ]
}
if {[llength [get_ports "GPIO_SW_W" -quiet] ] !=0} {
    set_property -dict {PACKAGE_PIN AF9 IOSTANDARD LVCMOS18} [get_ports "GPIO_SW_W" ]
}
if {[llength [get_ports "GPIO_SW_S" -quiet] ] !=0} {
    set_property -dict {PACKAGE_PIN AF8 IOSTANDARD LVCMOS18} [get_ports "GPIO_SW_S" ]
}
if {[llength [get_ports "GPIO_SW_C" -quiet] ] !=0} {
    set_property -dict {PACKAGE_PIN AE10 IOSTANDARD LVCMOS18} [get_ports "GPIO_SW_C" ]
}

#CPU RESET
if {[llength [get_ports "CPU_RESET" -quiet] ] !=0} {
    set_property -dict {PACKAGE_PIN AN8 IOSTANDARD LVCMOS18} [get_ports "CPU_RESET" ]
}

#GPIO LED
if {[llength [get_ports "GPIO_LED_0_LS" -quiet] ] !=0} {
    set_property -dict {PACKAGE_PIN AP8 IOSTANDARD LVCMOS18} [get_ports "GPIO_LED_0_LS" ]
}
if {[llength [get_ports "GPIO_LED_1_LS" -quiet] ] !=0} {
    set_property -dict {PACKAGE_PIN H23 IOSTANDARD LVCMOS18} [get_ports "GPIO_LED_1_LS" ]
}
if {[llength [get_ports "GPIO_LED_2_LS" -quiet] ] !=0} {
    set_property -dict {PACKAGE_PIN P20 IOSTANDARD LVCMOS18} [get_ports "GPIO_LED_2_LS" ]
}
if {[llength [get_ports "GPIO_LED_3_LS" -quiet] ] !=0} {
    set_property -dict {PACKAGE_PIN P21 IOSTANDARD LVCMOS18} [get_ports "GPIO_LED_3_LS" ]
}
if {[llength [get_ports "GPIO_LED_4_LS" -quiet] ] !=0} {
    set_property -dict {PACKAGE_PIN N22 IOSTANDARD LVCMOS18} [get_ports "GPIO_LED_4_LS" ]
}
if {[llength [get_ports "GPIO_LED_5_LS" -quiet] ] !=0} {
    set_property -dict {PACKAGE_PIN M22 IOSTANDARD LVCMOS18} [get_ports "GPIO_LED_5_LS" ]
}
if {[llength [get_ports "GPIO_LED_6_LS" -quiet] ] !=0} {
    set_property -dict {PACKAGE_PIN R23 IOSTANDARD LVCMOS18} [get_ports "GPIO_LED_6_LS" ]
}
if {[llength [get_ports "GPIO_LED_7_LS" -quiet] ] !=0} {
    set_property -dict {PACKAGE_PIN P23 IOSTANDARD LVCMOS18} [get_ports "GPIO_LED_7_LS" ]
}

#GPIO ROTARY
if {[llength [get_ports "ROTARY_INCA" -quiet] ] !=0} {
    set_property -dict {PACKAGE_PIN Y21 IOSTANDARD LVCMOS18} [get_ports "ROTARY_INCA" ]
}
if {[llength [get_ports "ROTARY_INCB" -quiet] ] !=0} {
    set_property -dict {PACKAGE_PIN AD26 IOSTANDARD LVCMOS18} [get_ports "ROTARY_INCB" ]
}
if {[llength [get_ports "ROTARY_PUSH" -quiet] ] !=0} {
    set_property -dict {PACKAGE_PIN AF28 IOSTANDARD LVCMOS18} [get_ports "ROTARY_PUSH" ]
}

#GPIO SMA
if {[llength [get_ports "USER_SMA_GPIO_N" -quiet] ] !=0} {
    set_property -dict {PACKAGE_PIN G27 IOSTANDARD LVCMOS18} [get_ports "USER_SMA_GPIO_N" ]
}
if {[llength [get_ports "USER_SMA_GPIO_P" -quiet] ] !=0} {
    set_property -dict {PACKAGE_PIN H27 IOSTANDARD LVCMOS18} [get_ports "USER_SMA_GPIO_P" ]
}

#GPIO DIP SW
if {[llength [get_ports "GPIO_DIP_SW0" -quiet] ] !=0} {
    set_property -dict {PACKAGE_PIN AN16 IOSTANDARD LVCMOS12} [get_ports "GPIO_DIP_SW0" ]
}
if {[llength [get_ports "GPIO_DIP_SW1" -quiet] ] !=0} {
    set_property -dict {PACKAGE_PIN AN19 IOSTANDARD LVCMOS12} [get_ports "GPIO_DIP_SW1" ]
}
if {[llength [get_ports "GPIO_DIP_SW2" -quiet] ] !=0} {
    set_property -dict {PACKAGE_PIN AP18 IOSTANDARD LVCMOS12} [get_ports "GPIO_DIP_SW2" ]
}
if {[llength [get_ports "GPIO_DIP_SW3" -quiet] ] !=0} {
    set_property -dict {PACKAGE_PIN AN14 IOSTANDARD LVCMOS12} [get_ports "GPIO_DIP_SW3" ]
}

#USB UART
if {[llength [get_ports "USB_UART_CTS" -quiet] ] !=0} {
    set_property -dict {PACKAGE_PIN L23 IOSTANDARD LVCMOS18} [get_ports "USB_UART_CTS" ]
}
if {[llength [get_ports "USB_UART_RTS" -quiet] ] !=0} {
    set_property -dict {PACKAGE_PIN K27 IOSTANDARD LVCMOS18} [get_ports "USB_UART_RTS" ]
}
if {[llength [get_ports "USB_UART_RX" -quiet] ] !=0} {
    set_property -dict {PACKAGE_PIN G25 IOSTANDARD LVCMOS18} [get_ports "USB_UART_RX" ]
}
if {[llength [get_ports "USB_UART_TX" -quiet] ] !=0} {
    set_property -dict {PACKAGE_PIN K26 IOSTANDARD LVCMOS18} [get_ports "USB_UART_TX" ]
}

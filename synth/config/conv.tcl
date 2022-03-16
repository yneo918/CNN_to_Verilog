# define global variables
global top
global designName

global vhdlFiles
global verilogFiles
global systemVerilogFiles
global xdcFiles


global clockName
global periodns

global synth
global opt
global place
global route

global maxCarryChain

# set global variables
set top top
set designName [lindex $argv 0]

set vhdlFiles [list ]
set verilogFiles [list ]
set systemVerilogFiles [list \
    ./srcs/modules.sv \
    ./srcs/maxpool.sv \
    ./srcs/layer.sv \
    ./srcs/booth.sv \
    ./srcs/pack.sv \
]
set xdcFiles [list ]

set clockName clk
set periodns 4

#set maxCarryChain 10

set synth [list \
    -max_dsp \
    0 \
]
#set synth "-max_dsp 0"

set opt [list \
-remap \
]

set place [list ]
set route [list ]

# vivado compilation
source script/syn.tcl

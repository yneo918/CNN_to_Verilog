# set output directories
set outputDir ./output/$designName
set dcpDir $outputDir/dcp
set repDir $outputDir/report
set expDir $outputDir/export
set bitDir $outputDir/bitstream

# make output directories
file mkdir $outputDir
file mkdir $dcpDir
file mkdir $repDir
file mkdir $expDir
file mkdir $bitDir

# read VHDL files
if { [llength $vhdlFiles] } {
    read_vhdl [split $vhdlFiles " "]
}
# read Verilog-HDL files
if { [llength $verilogFiles] } {
    read_verilog [split $verilogFiles " "]
}
# read SystemVerilog files
if { [llength  $systemVerilogFiles] } {
    read_verilog -sv [split $systemVerilogFiles " "]
}
# read XDC files
if { [llength $xdcFiles] } {
    read_xdc [split $xdcFiles " "]
}

# set board specific bariables.
source script/board.tcl

# compile design and save progress
if { [llength $synth] } {
    eval synth_design -top $top -part $part [split $synth " "]
} else {
    synth_design -top $top -part $part
}
write_checkpoint -force $dcpDir/synth.dcp

# write timing and resource report
report_timing_summary -file $repDir/timing-post-synth.rpt
report_utilization -file $repDir/utilizationpost-synth.rpt

# pin assignment
# source script/pin.tcl
# set freqency and disable clock dedicated route
create_clock -period $periodns -name virtual_clock [get_ports $clockName]
set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets ${clockName}_IBUF_inst/O]
# if { [llength [get_cells -hier -filter {ref_name == CARRY8}]] >= 1} {
#     set_property CARRY_REMAP $maxCarryChain [get_cells -hier -filter {ref_name == CARRY8}]
# }

# optimaze and place fpga resources.
if { [llength $opt] } {
    opt_design [split $opt " "]
} else {
    opt_design
}
if { [llength $place] } {
    place_design [split $place " "]
} else {
    place_design
}
# save progress
write_checkpoint -force $dcpDir/place.dcp

# write clock-utilization, resources, timing report
report_clock_utilization -file $repDir/clock-util.rpt
report_utilization -file $repDir/utilization-post-place.rpt
report_timing_summary -file $repDir/timing-summary-post-place.rpt

# run routing and save progress
if { [llength $route] } {
    route_design [split $route " "]
} else {
    route_design
}
write_checkpoint -force $dcpDir/route.dcp

# run optimization ,placing, and routing until slack mets
while {[get_property SLACK [get_timing_paths -max_paths 1 -nworst 1 -setup]] < 0} {
    set slack [get_property SLACK [get_timing_paths -max_paths 1 -nworst 1 -setup]]
    set periodns  [expr $periodns + max( abs($slack *4.0 / 5.0), 0.1) ]
    create_clock -period $periodns -name vclock [get_ports $clockName]
    if { [llength $opt] } {
        opt_design [split $opt " " ]
    } else {
        opt_design
    }
    if { [llength $place] } {
        place_design [split $place " "]
    } else {
        place_design
    }
    if { [llength $route] } {
        route_design [split $route " "]
    } else {
        route_design
    }
}

# after slack mets, save progress and write some reports
write_checkpoint -force $dcpDir/slack-met.dcp
report_clock_utilization -file $repDir/clock-util-slack-met.rpt
report_utilization -file $repDir/utilization-slack-met.rpt
report_timing_summary -file $repDir/timing-summary.rpt
report_route_status -file $repDir/route-status.rpt
report_power -file $repDir/power.rpt
report_drc -file $repDir/drc.rpt
report_pipeline_analysis -file $repDir/pipeline1.rpt -max_added_latency 1 -include_paths_to_pipeline
report_pipeline_analysis -file $repDir/pipeline2.rpt -max_added_latency 2 -include_paths_to_pipeline
report_pipeline_analysis -file $repDir/pipeline3.rpt -max_added_latency 3 -include_paths_to_pipeline

write_verilog -force $expDir/${top}-netlist.v -mode timesim -sdf_anno true

#write_bitstream -force $bitDir/${top}.bit

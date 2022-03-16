#!/bin/bash
function run() {
    vivado -nojournal -nolog -mode batch -source config/$1 -tclargs $2 | tee log/${1%.tcl}.log
}
run fc.tcl "fc3_9"

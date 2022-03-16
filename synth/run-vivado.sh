#!/bin/bash
function run() {
    # echo log/${1%.tcl}.log
    vivado -nojournal -nolog -mode batch -source config/$1 | tee log/${1%.tcl}.log
}
run fc.tcl

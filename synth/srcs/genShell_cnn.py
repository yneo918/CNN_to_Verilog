import sys

args = sys.argv
OUTPUT_FILE = open("run.sh","w")
OUTPUT_FILE.write("#!/bin/bash\n")
OUTPUT_FILE.write("function run() {\n")
OUTPUT_FILE.write("    vivado -nojournal -nolog -mode batch -source config/$1 -tclargs $2 | tee log/${1%.tcl}.log\n")
OUTPUT_FILE.write("}\n")
OUTPUT_FILE.write("run cnn.tcl "+str(args[1])+"\n")
OUTPUT_FILE.close()
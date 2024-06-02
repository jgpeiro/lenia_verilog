# 
# Usage: To re-create this platform project launch xsct with below options.
# xsct C:\Users\jgpei\workspace\axi_convolution\platform.tcl
# 
# OR launch xsct and run below command.
# source C:\Users\jgpei\workspace\axi_convolution\platform.tcl
# 
# To create the platform in a different location, modify the -out option of "platform create" command.
# -out option specifies the output directory of the platform project.

platform create -name {axi_convolution}\
-hw {C:\Users\jgpei\ebaz_hello_world\design_1_wrapper10.xsa}\
-proc {ps7_cortexa9_0} -os {standalone} -out {C:/Users/jgpei/workspace}

platform write
platform generate -domains 
platform active {axi_convolution}
platform generate
platform generate
platform clean
platform generate

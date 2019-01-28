set PROJ_NAME swerv_wrapper
set PROJ_DIR .
set TOP_NAME swerv_wrapper

create_project -in_memory -part xc7z020clg484-1

set_property parent.project_path ${PROJ_DIR}/${PROJ_NAME}.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property board_part em.avnet.com:zed:part0:1.3 [current_project]
set_property vhdl_version vhdl_2k [current_fileset]
# add_files ${PROJ_DIR}/${PROJ_NAME}.srcs/sources_1/bd/zed_base/zed_base.bd

# set XDC_LIST "\
#   ${PROJ_DIR}/${PROJ_NAME}.srcs/sources_1/bd/zed_base/ip/zed_base_axi_gpio_0_0/zed_base_axi_gpio_0_0_board.xdc \
#   ${PROJ_DIR}/${PROJ_NAME}.srcs/sources_1/bd/zed_base/ip/zed_base_axi_gpio_0_0/zed_base_axi_gpio_0_0_ooc.xdc \
    # "
# foreach i $XDC_LIST {
#   set_property used_in_implementation false [get_files -all ${i} ]
# }

read_verilog -sv ../configs/snapshots/default/common_defines.vh
read_verilog -sv ../design/include/def.sv

set_property is_global_include true [get_files ../configs/snapshots/default/common_defines.vh] [get_files ../design/include/def.sv]

source filelist.tcl

read_xdc synth.xdc
# set_property used_in_implementation false [get_files synth.xdc]

# read_xdc dont_touch.xdc
# set_property used_in_implementation false [get_files dont_touch.xdc]

synth_design -top ${TOP_NAME} -part xc7z020clg484-1 -verilog_define PP_BUSWIDTH_64=1 -include_dirs {../design/include ../configs/snapshots/default/} -fanout_limit 10000 -flatten_hierarchy rebuilt
write_checkpoint -force ${TOP_NAME}.dcp

write_verilog -force ${TOP_NAME}.syn.v

report_utilization -file ${TOP_NAME}_utilization_synth.rpt -pb ${TOP_NAME}_utilization_synth.pb
report_timing_summary -file ${TOP_NAME}_timing_synth_summary.rpt
report_timing         -file ${TOP_NAME}_timing_synth.rpt -sort group -max_paths 100

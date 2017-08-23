set_family {SmartFusion2}
read_vhdl -mode vhdl_2008 {D:\sandbox\logicgate\hdl\test_button.vhdl}
set_top_level {test_button}
map_netlist
check_constraints {D:\sandbox\logicgate\constraint\synthesis_sdc_errors.log}
write_fdc {D:\sandbox\logicgate\designer\test_button\synthesis.fdc}

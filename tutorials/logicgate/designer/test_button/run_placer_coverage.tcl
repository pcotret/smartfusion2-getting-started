set_family {SmartFusion2}
read_adl {D:\sandbox\logicgate\designer\test_button\test_button.adl}
map_netlist
check_constraints {D:\sandbox\logicgate\designer\test_button\placer_coverage.log}
write_sdc -strict {D:\sandbox\logicgate\designer\test_button\place_route.sdc}

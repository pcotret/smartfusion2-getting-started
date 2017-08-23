open_project -project {D:\sandbox\logicgate\designer\test_button\test_button_fp\test_button.pro}
set_programming_file -name {M2S025} -file {D:\sandbox\logicgate\designer\test_button\test_button.ipd}
enable_device -name {M2S025} -enable 1
set_programming_action -action {PROGRAM} -name {M2S025} 
run_selected_actions
set_programming_file -name {M2S025} -no_file
save_project
close_project

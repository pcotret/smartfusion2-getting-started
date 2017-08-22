open_project -project {D:\sandbox\microsemi-tutorial\tutorials\led-blinking\designer\LedBlinkingDSpeed\LedBlinkingDSpeed_fp\LedBlinkingDSpeed.pro}
set_programming_file -name {M2S025} -file {D:\sandbox\microsemi-tutorial\tutorials\led-blinking\designer\LedBlinkingDSpeed\LedBlinkingDSpeed.ipd}
enable_device -name {M2S025} -enable 1
set_programming_action -action {PROGRAM} -name {M2S025} 
run_selected_actions
set_programming_file -name {M2S025} -no_file
save_project
close_project

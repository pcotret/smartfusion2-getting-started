new_project \
         -name {test_button} \
         -location {D:\sandbox\logicgate\designer\test_button\test_button_fp} \
         -mode {chain} \
         -connect_programmers {FALSE}
add_actel_device \
         -device {M2S025} \
         -name {M2S025}
enable_device \
         -name {M2S025} \
         -enable {TRUE}
save_project
close_project

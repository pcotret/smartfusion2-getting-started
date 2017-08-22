new_project \
         -name {LedBlinkingDSpeed} \
         -location {C:\Users\Giovanna.Franco\Desktop\LedBlinkingDSpeed\designer\LedBlinkingDSpeed\LedBlinkingDSpeed_fp} \
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

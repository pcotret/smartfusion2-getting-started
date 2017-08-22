set_device \
    -family  SmartFusion2 \
    -die     PA4M2500_N \
    -package vf256 \
    -speed   STD \
    -tempr   {COM} \
    -voltr   {COM}
set_def {VOLTAGE} {1.2}
set_def {VCCI_1.2_VOLTR} {COM}
set_def {VCCI_1.5_VOLTR} {COM}
set_def {VCCI_1.8_VOLTR} {COM}
set_def {VCCI_2.5_VOLTR} {COM}
set_def {VCCI_3.3_VOLTR} {COM}
set_def USE_TCGEN 1
set_def NETLIST_TYPE EDIF
set_name LedBlinkingDSpeed
set_workdir {D:\sandbox\microsemi-tutorial\tutorials\led-blinking\designer\LedBlinkingDSpeed}
set_log     {D:\sandbox\microsemi-tutorial\tutorials\led-blinking\designer\LedBlinkingDSpeed\LedBlinkingDSpeed_sdc.log}
set_design_state pre_layout

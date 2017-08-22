quietly set ACTELLIBNAME SmartFusion2
quietly set PROJECT_DIR "C:/Users/Giovanna.Franco/Desktop/EmailedLedBlinkingDemo6Sept2016/SmartFusion2/LedBlinkingDSpeed"

if {[file exists ../designer/LedBlinkingDSpeed/simulation/postlayout/_info]} {
   echo "INFO: Simulation library ../designer/LedBlinkingDSpeed/simulation/postlayout already exists"
} else {
   file delete -force ../designer/LedBlinkingDSpeed/simulation/postlayout 
   vlib ../designer/LedBlinkingDSpeed/simulation/postlayout
}
vmap postlayout ../designer/LedBlinkingDSpeed/simulation/postlayout
vmap SmartFusion2 "C:/Microsemi/Libero_SoC_v11.7///Designer//lib//modelsim//precompiled/vhdl/SmartFusion2"

vcom -2008 -explicit  -work postlayout "${PROJECT_DIR}/designer/LedBlinkingDSpeed/LedBlinkingDSpeed_ba.vhd"
vcom -2008 -explicit  -work postlayout "${PROJECT_DIR}/stimulus/LedBlinkingDSpeed_tb.vhd"

vsim -L SmartFusion2 -L postlayout  -t 1fs -sdfmax /LedBlinkingDSpeed_0=${PROJECT_DIR}/designer/LedBlinkingDSpeed/LedBlinkingDSpeed_ba.sdf postlayout.LedBlinkingDSpeed_tb
add wave /LedBlinkingDSpeed_tb/*
run 1000ns

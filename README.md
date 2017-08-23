# Microsemi SmartFusion2 tutorial
## Introduction
I've been interested in heterogeneous SoCs  we can find on the market for quite some time. The two main FPGA manufacturers (Intel/Altera and Xilinx) both propose an architecture based on a FPGA and ARM Cortex-A9 processors.

Another manufacturer (Microsemi) proposes SmartFusion2 which are devices including a Cortex-M3 processor:

* The Cortex-A9 may be oversized for simple applications...
* Cortex-M devices include different debug options compared to Cortex-A.

## Libero SoC tools
Microsemi dev tools are known as [Libero SoC](https://www.microsemi.com/products/fpga-soc/design-resources/design-software/libero-soc).

![screen](https://raw.githubusercontent.com/pcotret/smartfusion2-getting-started/master/img/img0.png)

You can see that the GUI is quite similar to Vivado: toolbar on the left, block diagram creation in the main tab, etc.

### Installing Libero
I'm going straight to the point (avoiding errors in the installation process...). At this moment, the stable version of Libero is 11.8. In order to have a clean install on a Windows-based computer, please install (in this order):

* [Libero SoC v11.8 for Windows](https://www.microsemi.com/document-portal/doc_download/136652-download-libero-soc-v11-8-for-windows)
* [Synplify Pro ME L2016.09M-2](https://soc.microsemi.com/portal/default.aspx?r=3&p=f=SynplifyPro_L2016_09M2_WIN)
* [Mega Vault v11.8](https://www.microsemi.com/document-portal/doc_download/136712-mega-vault-v11-8)
* [Libero SoC v11.8 SP1 for Windows](https://www.microsemi.com/document-portal/doc_download/137416-download-libero-soc-v11-8-sp1-for-windows)
* [Mega Vault v11.8 SP1](https://www.microsemi.com/document-portal/doc_download/137418-mega-vault-for-libero-soc-v11-8-sp1)
* [Microsemi SoftConsole](https://www.microsemi.com/products/fpga-soc/design-resources/design-software/softconsole#downloads)

Now, everything should be OK. Just look at the license section to add your license file.

## Boards
Microsemi offers different development kits with a SmartFusion2 device. First, I had my hands on the [SmartFusion2 Starter Kit](https://www.microsemi.com/products/fpga-soc/design-resources/dev-kits/smartfusion2/smartfusion2-starter-kit): more precisely, the SF2060-STARTER-KIT with a M2S060-FGG484 device. Unfortunately, the free license available with M2S060 does not allow FPGA synthesis...

I've had the opportunity to get a [Microsemi Creative Board](https://www.microsemi.com/products/fpga-soc/design-resources/dev-kits/smartfusion2/future-creative-board).

* Still a SmartFusion2 device (M2S025).
* Arduino and Zigbee headers.
* M2S025 is available with a free Silver license allowing us to synthesize stuff!

In the rest of this repository, I'll be using the SmartFusion2 Creative Board for examples/tutorials.

## Licences
![device](https://raw.githubusercontent.com/pcotret/smartfusion2-getting-started/master/img/img1.png)
![license](https://raw.githubusercontent.com/pcotret/smartfusion2-getting-started/master/img/img2.png)

## Go on the wiki to start playing with the board

Have a look at [here](https://github.com/pcotret/smartfusion2-getting-started/wiki) to get to the wiki homepage.

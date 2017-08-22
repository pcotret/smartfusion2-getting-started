--------------------------------------------------------------------------------------------------------
-- Company: Future Electronics Inc.
--
-- File: Display.vhd
-- File history:
--      Rev. 1: 8/23/2016: 
--
-- Description: 
-- Display outputs
--
-- Targeted device: <Family::SmartFusion2> <Die::M2S025> <Package::256 VF>
-- Author: Giovanna Franco
--
--------------------------------------------------------------------------------------------------------
-- Copyright (c) 2016   Future Electronics
--                      All rights reserved.
--------------------------------------------------------------------------------------------------------
-- Disclaimer of Warranty
-- ALL MATERIALS, INFORMATION AND SERVICES ARE PROVIDED "AS-IS" AND "AS-AVAILABLE" FOR YOUR USE. 
-- FUTURE ELECTRONICS DISCLAIMS ALL WARRANTIES OF ANY KIND, EITHER EXPRESS OR IMPLIED, INCLUDING 
-- BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR 
-- PURPOSE, TITLE, OR NON-INFRINGEMENT.
-- YOU ACKNOWLEDGE AND AGREE THAT THE REFERENCE DESIGNS AND OTHER SUCH DESIGN MATERIALS INCLUDED 
-- HEREIN ARE PROVIDED AS AN EXAMPLE ONLY AND THAT YOU WILL EXERCISE YOUR OWN INDEPENDENT ANALYSIS 
-- AND JUDGEMENT IN YOUR USE OF THESE MATERIALS. FUTURE ELECTRONICS ASSUMES NO LIABILITY FOR YOUR 
-- USE OF THESE MATERIALS FOR YOUR PRODUCT DESIGNS.
-- 
-- Indemnification
-- You agree to indemnify, defend and hold Future Electronics and all of its agents, directors, 
-- employees, information providers, licensors and licensees, and affiliated companies 
-- (collectively, "Indemnified Parties"), harmless from and against any and all liability 
-- and costs (including, without limitation, attorneysâ?? fees and costs), incurred by the 
-- Indemnified Parties in connection with any claim arising out of any breach by You of these 
-- Terms and Conditions of Use or any representations or warranties made by You herein. 
-- You will cooperate as fully as reasonably required in Future Electronicsâ?? defense of any claim. 
-- Future Electronics reserves the right, at its own expense, to assume the exclusive defense and 
-- control of any matter otherwise subject to indemnification by You and You shall not in any event 
-- settle any matter without the written consent of Future Electronics.
-- 
-- Limitation of Liability
-- UNDER NO CIRCUMSTANCES SHALL FUTURE ELECTRONICS, NOR ITS AGENTS, DIRECTORS, EMPLOYEES, 
-- INFORMATION PROVIDERS, LICENSORS AND LICENSEE, AND AFFILIATED COMPANIES BE LIABLE FOR ANY DAMAGES, 
-- INCLUDING WITHOUT LIMITATION, DIRECT, INDIRECT, INCIDENTAL, SPECIAL, PUNITIVE, CONSEQUENTIAL, OR 
-- OTHER DAMAGES (INCLUDING WITHOUT LIMITATION LOST PROFITS, LOST REVENUES, OR SIMILAR ECONOMIC LOSS), 
-- WHETHER IN CONTRACT, TORT, OR OTHERWISE, ARISING OUT OF THE USE OR INABILITY TO USE THE MATERIALS 
-- PROVIDED AS A REFERENCE DESIGN, EVEN IF WE ARE ADVISED OF THE POSSIBILITY THEREOF, NOR FOR ANY CLAIM 
-- BY A THIRD PARTY.
--------------------------------------------------------------------------------------------------------

library IEEE;

use IEEE.std_logic_1164.all;

entity Display is
port (
       -- Inputs
       clk : in std_logic;
       SW1 : in std_logic;
       SW2 : in std_logic;
       reset : in std_logic;
       led : in std_logic;
       led0 : in std_logic;
       led1 : in std_logic;
       led2 : in std_logic;

       -- Outputs
       green_led1 : out std_logic;
       red_led1 : out std_logic;
       green_led2 : out std_logic;
       red_led2 : out std_logic
);
end Display;
architecture architecture_Display of Display is
begin

   -- architecture body
    process(reset,clk)
    begin
        if reset = '0' then 
            green_led1 <= '0';
            red_led1 <= '0';
            green_led2 <= '0';
            red_led2 <= '0';
        elsif rising_edge(clk) then
			if SW1 = '1' and SW2 = '0' then
                green_led1 <= led;
                red_led1 <= '0';
                green_led2 <= '0';
                red_led2 <= led1;
			elsif SW2 = '1' and SW1 = '0' then
                green_led1 <= led0;
                red_led1 <= '0';
                green_led2 <= '0';
                red_led2 <= led2;
			else
                green_led1 <= led0;
                red_led1 <= '0';
                green_led2 <= '0';
                red_led2 <= led1;
			end if;
        end if;
    end process;

end architecture_Display;

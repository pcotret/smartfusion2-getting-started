--------------------------------------------------------------------------------------------------------
-- Company: Future Electronics Inc.
--
-- File: ClkGen.vhd
-- File history:
--      Rev. 1: 8/23/2016
--
-- Description: 
--
-- clock generator with switch
--
-- Targeted device: <Family::SmartFusion2> <Die::M2S025> <Package::256 VF>
-- Author: Giovanna Franco
--
--------------------------------------------------------------------------------------------------------
-- Copyright (c) 2016   Future Electronics
--                      All rights reserved.
--------------------------------------------------------------------------------------------------------
-- Disclaimer of Warranty
-- ALL MATERIALS, INFORMATION AND SERVICES ARE PROVIDED "AS-IS"ù AND "AS-AVAILABLE"ù FOR YOUR USE. 
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
-- (collectively, ""Indemnified Parties"ù), harmless from and against any and all liability 
-- and costs (including, without limitation, attorneys"" fees and costs), incurred by the 
-- Indemnified Parties in connection with any claim arising out of any breach by You of these 
-- Terms and Conditions of Use or any representations or warranties made by You herein. 
-- You will cooperate as fully as reasonably required in Future Electronics"" defense of any claim. 
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

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;
USE ieee.std_logic_unsigned.all;

entity ClkGen is
port (
    -- Inputs
    clkIn : in std_logic;
    reset : in std_logic;
    SW: in std_logic;
    scale : in std_logic_vector(31 downto 0);
    -- Outputs
    clkOut : out std_logic
);
end ClkGen;
architecture architecture_ClkGen of ClkGen is
   -- signals
	signal cnt : std_logic_vector(31 downto 0) := "00000000000000000000000000000000";
    signal tmp_clk : std_logic := '0'; 
    signal Scale_Factor1 : std_logic_vector(31 downto 0) := "00000000000000000000000000000000";

begin

   -- architecture body
    process(reset,clkIn)

    begin
    Scale_Factor1 <= scale;
    if reset = '0' then
            cnt <= "00000000000000000000000000000000";
            tmp_clk <= '0';
    elsif rising_edge(clkIn) and SW = '1' then
            cnt <= cnt + "00000000000000000000000000000001";
            if cnt < (Scale_Factor1 srl 1) then
                tmp_clk <= '1';
                cnt <= cnt + "00000000000000000000000000000001";
            elsif cnt < Scale_Factor1 or cnt = (Scale_Factor1 srl 1) then
                tmp_clk <= '0';
                cnt <= cnt + "00000000000000000000000000000001";
            else
                cnt <= "00000000000000000000000000000000";
                tmp_clk <= '0';
            end if;
    end if;
    end process;
    clkOut <= tmp_clk;
end architecture_ClkGen;

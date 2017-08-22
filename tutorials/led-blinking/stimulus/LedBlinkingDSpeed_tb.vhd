--------------------------------------------------------------------------------------------------------
-- Company: Future Electronics Inc.
--
-- File: LedBlinkingDSpeed_tb.vhd
-- File history:
--      Rev. 1: 8/23/2016
--
-- Description: 
--
-- Testbench
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
-- and costs (including, without limitation, attorneys" fees and costs), incurred by the 
-- Indemnified Parties in connection with any claim arising out of any breach by You of these 
-- Terms and Conditions of Use or any representations or warranties made by You herein. 
-- You will cooperate as fully as reasonably required in Future Electronics" defense of any claim. 
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


library ieee;
use ieee.std_logic_1164.all;

entity LedBlinkingDSpeed_tb is
end LedBlinkingDSpeed_tb;

architecture behavioral of LedBlinkingDSpeed_tb is

    constant SYSCLK_PERIOD : time := 100 ns; 
    
    signal SYSCLK : std_logic := '0';
    --signal NSYSRESET : std_logic := '0';
    signal SWITCH1 : std_logic := '0';
    signal SWITCH2 : std_logic := '0';
    signal GREEN1 : std_logic := '0';
    signal RED1 : std_logic := '0';
    signal GREEN2 : std_logic := '0';
    signal RED2 : std_logic := '0';

    component LedBlinkingDSpeed
        -- ports
        port( 
            -- Inputs
            clk : in std_logic;
            SW1 : in std_logic;
            SW2 : in std_logic;
            --reset : in std_logic;

            -- Outputs
            green_led1 : out std_logic;
            red_led1 : out std_logic;
            green_led2 : out std_logic;
            red_led2 : out std_logic

            -- Inouts

        );
    end component;

begin     

    process
        variable vhdl_initial : BOOLEAN := TRUE;

    begin
        if ( vhdl_initial ) then
            -- Reset the Outputs to zero
            SWITCH1 <= '1';
			SWITCH2 <= '1';
            wait for (SYSCLK_PERIOD * 10);

			-- Test Case 1
			-- Set SWITCH1 to '0' and SWITCH2 to '0' for 10000 clock period
			-- GREEN1 blinks every 10 us and RED1 is turned off
			-- RED2 blinks every 20 us and GREEN2 is turned off
            SWITCH1 <= '0';
			SWITCH2 <= '0';
            wait for (SYSCLK_PERIOD * 10000);

            -- Test Case 2
			-- Set SWITCH1 to '0' for 10000 clock period
			-- GREEN1 blinks every 10 us and RED1 is turned off
            SWITCH1 <= '0';
			-- Set SWITCH2 to '1' for 10000 clock period
			-- RED2 blinks every 10 us and GREEN2 is turned off
            SWITCH2 <= '1';
            wait for (SYSCLK_PERIOD * 10000);	

            -- Test Case 3
            -- Set SWITCH1 to '1' for 10000 clock period
			-- GREEN1 blinks every 5 us and RED1 is turned off
            SWITCH1 <= '1';
			-- Set SWITCH2 to '0' for 10000 clock period
			-- RED2 blinks every 20 us and GREEN2 is turned off
            SWITCH2 <= '0';
            wait for (SYSCLK_PERIOD * 10000);		
            wait;
        end if;
    end process;

    -- Clock Driver
    SYSCLK <= not SYSCLK after (SYSCLK_PERIOD / 2.0 );

    -- Instantiate Unit Under Test:  LedBlinkingDSpeed
    LedBlinkingDSpeed_0 : LedBlinkingDSpeed
        -- port map
        port map( 
            -- Inputs
            clk => SYSCLK,
            SW1 => SWITCH1,
            SW2 => SWITCH2,
            --reset => NSYSRESET,

            -- Outputs
            green_led1 =>  GREEN1,
            red_led1 =>  RED1,
            green_led2 =>  GREEN2,
            red_led2 =>  RED2

            -- Inouts

        );

end behavioral;
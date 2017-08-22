--------------------------------------------------------------------------------------------------------
-- Company: Future Electronics Inc.
--
-- File: LedBlinkingDSpeed.vhd
-- File history:
--      Rev. 1: 8/23/2016: 
--
-- Description: 
--  - Power up --> led 1(green) blinks every 1sec and led 2(red) blinks every 2sec
--  - Press and hold SW1 --> led 1(green) blinks every 0.5sec
--  - Press and hold SW2 --> led 2(red) blinks every 1sec
--  - Press and hold SW1 and SW2 --> led 1(green) and led 2(red) turn off
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


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;
USE ieee.std_logic_unsigned.all;

entity LedBlinkingDSpeed is
port (
       -- Inputs
       clk : in std_logic;
       SW1 : in std_logic;
       SW2 : in std_logic;
       -- Outputs
       green_led1 : out std_logic;
       red_led1 : out std_logic;
       green_led2 : out std_logic;
       red_led2 : out std_logic
);
end LedBlinkingDSpeed;

architecture architecture_LedBlinkingDSpeed of LedBlinkingDSpeed is
    -- signals
	signal reset : std_logic := '0';
    signal led : std_logic := '0';
    signal led0 : std_logic := '0';
    signal led1 : std_logic := '0';
    signal led2 : std_logic := '0';
    ---------------------------------------------------------------------------------------------------------------
    -- Scale Factor used to program the board
    -- Due to long simulation period, comment these factor if you want to simulate 
    signal Scale_Factor0 : std_logic_vector(31 downto 0) := "00000101111101011110000100000000"; --every 2 sec
    signal Scale_Factor1 : std_logic_vector(31 downto 0) := "00000001011111010111100001000000"; --every 0.5 sec
    signal Scale_Factor3 : std_logic_vector(31 downto 0) := "00000010111110101111000010000000"; --every 1 sec
    ---------------------------------------------------------------------------------------------------------------
    -- Scale Factor used to simulate
    -- signal Scale_Factor0 : std_logic_vector(31 downto 0) := "00000000000000000000001111101000"; --every 20 us
    -- signal Scale_Factor1 : std_logic_vector(31 downto 0) := "00000000000000000000000011111010"; --every 5 us
    -- signal Scale_Factor3 : std_logic_vector(31 downto 0) := "00000000000000000000000111110100"; --every 10 us
    ---------------------------------------------------------------------------------------------------------------

    -- component
    component Reset_out
    port (
        -- Inputs
        clk : in std_logic;
        SW1 : in std_logic;
        SW2 : in std_logic;
        -- Output
        reset : out std_logic
    );
    end component;


    component ClkGenNoSwitch
    port (
        -- Inputs
        clkIn : in std_logic;
        reset : in std_logic;
        scale : in std_logic_vector(31 downto 0);
        -- Outputs
        clkOut : out std_logic
    );
    end component;

    component ClkGen
    port (
        -- Inputs
        clkIn : in std_logic;
        reset : in std_logic;
        SW: in std_logic;
        scale : in std_logic_vector(31 downto 0);
        -- Outputs
        clkOut : out std_logic
    );
    end component;

    component Display
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
    end component;

begin
    
    Clear_outputs : Reset_out
    port map(
        -- Inputs
        clk => clk,
        SW1 => SW1,
        SW2 => SW2,
        -- Output
        reset => reset
    );

    Initial_blinking_SW1 : ClkGenNoSwitch
    port map (
        -- Inputs
        clkIn => clk,
        reset => reset,
        scale => Scale_Factor3,
        -- Outputs
        clkOut => led0
    );

    Fast_clk_SW1 : ClkGen
    -- port map
    port map(
        -- Inputs
        clkIn => clk,
        reset => reset,
        SW => SW1,
        scale => Scale_Factor1,
        -- Outputs
        clkOut => led
    );

    Initial_blinking_SW2 : ClkGenNoSwitch
    port map (
        -- Inputs
        clkIn => clk,
        reset => reset,
        scale => Scale_Factor0,
        -- Outputs
        clkOut => led1
    );

    Fast_clk_SW2 : ClkGen
    -- port map
    port map(
        -- Inputs
        clkIn => clk,
        reset => reset,
        SW => SW2,
        scale => Scale_Factor3,
        -- Outputs
        clkOut => led2
    );

    Display_out : Display
    -- port map
    port map(
        -- Inputs
        clk => clk,
        SW1 => SW1,
        SW2 => SW2,
        reset => reset,
        led => led,
        led0 => led0,
        led1 => led1,
        led2 => led2,
    
        -- Outputs
        green_led1 => green_led1,
        red_led1 => red_led1,
        green_led2 => green_led2,
        red_led2 => red_led2
    );
    
end architecture_LedBlinkingDSpeed;
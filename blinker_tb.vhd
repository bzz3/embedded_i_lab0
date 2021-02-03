--
-- filename:    blinker_tb.vhd
-- written by:  steve dinicolantonio
-- description: testbench for blinker.vhd
-- notes:       
--
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

library ieee;
    use ieee.std_logic_1164.all;
    use ieee.numeric_std.all;

entity blinker_tb is
end blinker_tb;

architecture testbench of blinker_tb is

    signal tb_clk : std_logic := '0';
    signal tb_sw3 : std_logic := '0';
    signal tb_led3 : std_logic;
    
    component blinker is
        port(
        
            clk  : in std_logic;        -- 125 Mhz clock
            sw3  : in std_logic;        -- switch, '1' = on
            
            led3 : out std_logic        -- led, '1' = on
        
        );
    end component;

begin

--------------------------------------------------------------------------------
-- procs
--------------------------------------------------------------------------------

    -- simulate a 125 Mhz clock
    clk_gen_proc: process
    begin
    
        wait for 4 ns;
        tb_clk <= '1';
        
        wait for 4 ns;
        tb_clk <= '0';
    
    end process clk_gen_proc;
    
    -- flip the switch high after 1ms
    switch_proc: process
    begin
    
        wait for 1 ms;
        tb_sw3 <= '1';
    
    end process switch_proc;
    
--------------------------------------------------------------------------------
-- port mapping
--------------------------------------------------------------------------------

    dut : blinker
    port map (
    
        clk  => tb_clk,
        sw3  => tb_sw3,
        led3 => tb_led3
    
    );

    
end testbench; 

--
-- filename:    blinker.vhd
-- written by:  steve dinicolantonio
-- description: blinks an led at a rate of 1Hz
-- notes:       
--
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

library ieee;
    use ieee.std_logic_1164.all;
    use ieee.numeric_std.all;

entity blinker is
    port(

        clk  : in std_logic;        -- 125 Mhz clock
        sw3  : in std_logic;        -- switch, '1' = on
        
        led3 : out std_logic        -- led, '1' = on

    );
end blinker;

architecture behavior of blinker is

    signal counter : std_logic_vector(26 downto 0) := (others => '0');

begin

    process(clk)
    begin
    
        if rising_edge(clk) then
        
            if (sw3 = '0') then
                led3 <= '0';
                counter <= (others => '0');
                
            else
            
                -- count one full led period (2 Hz)
                
--                if (unsigned(counter) < 124999999) then
                if (unsigned(counter) < 62499999) then
                    counter <= std_logic_vector(unsigned(counter) + 1);
                    
                else
                    counter <= (others => '0');
                    
                end if;
                
                -- turn the led on for half of the period (50% duty cycle)
                -- when sw3 is high
                
--                if (unsigned(counter) < 62500000) then
                if (unsigned(counter) < 31250000) then
                    led3 <= '1';
                    
                else
                    led3 <= '0';
                    
                end if;
            
            end if;
            
        end if;
    
    end process;
    
end behavior;
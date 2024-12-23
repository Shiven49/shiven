library ieee;
use ieee.std_logic_1164.all;



entity test_right_shift_by_1 is
end test_right_shift_by_1;

architecture behavior of test_right_shift_by_1 is

     
    component right_shift_by_1
        port(
            data_in: in std_logic_vector(0 to 27);
            data_out: out std_logic_vector(0 to 27)
        );
    end component;

    signal data_in: std_logic_vector(0 to 27);
    signal data_out: std_logic_vector(0 to 27);

  

begin
   
    uut: left_right_by_1 port map (
        data_in => data_in,
        data_out => data_out
    );

    -- Test process
    testprocess: process
    begin
        -- Apply a test vector to `data_in`
        data_in <= "0111111111111111111111111110"; 
        wait for 10 ns;

    end process testprocess;
end architecture behavior;

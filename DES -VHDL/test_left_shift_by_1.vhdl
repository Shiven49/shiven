library ieee;
use ieee.std_logic_1164.all;


entity test_left_shift_by_1 is
end test_left_shift_by_1;

architecture behavior of test_left_shift_by_1 is

     
    component left_shift_by_1
        port(
            data_in: in std_logic_vector(0 to 27);
            data_out: out std_logic_vector(0 to 27)
        );
    end component;

    signal data_in: std_logic_vector(0 to 27);
    signal data_out: std_logic_vector(0 to 27);

  

begin
   
    uut: left_shift_by_1 port map (
        data_in => data_in,
        data_out => data_out
    );

    -- Test process
    
end architecture behavior;

library ieee;
use ieee.std_logic_1164.all;

entity test_swap_left_right_64_bits is
end test_swap_left_right_64_bits;

architecture behavior of test_swap_left_right_64_bits is

 
    component swap_left_right_64_bits is
        port(
            data_in_left   : in  std_logic_vector(31 downto 0);
            data_in_right  : in  std_logic_vector(31 downto 0);
            data_out_left  : out std_logic_vector(31 downto 0);
            data_out_right : out std_logic_vector(31 downto 0)
        );
    end component;
   
    signal data_in_left  : std_logic_vector(31 downto 0);
    signal data_in_right : std_logic_vector(31 downto 0);
    signal data_out_left : std_logic_vector(31 downto 0);
    signal data_out_right: std_logic_vector(31 downto 0);

   

begin

    
    uut: swap_left_right_64_bits 
        port map (
            data_in_left   => data_in_left,
            data_in_right  => data_in_right,
            data_out_left  => data_out_left,
            data_out_right => data_out_right
        );

    -- Test Process
    testprocess: process
    begin
        data_in_left  <= "11111111111111111111111111111111";
        data_in_right <= "00000000000000000000000000000000";
        wait for 10 ns;

        
    end process testprocess;

end architecture behavior;

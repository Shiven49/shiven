library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity test_s_boxes is
end test_s_boxes;

architecture behavior of test_s_boxes is
  
    signal data_in  : std_logic_vector(5 downto 0);
    signal data_out : std_logic_vector(3 downto 0);


    component s1_box
        port (
            data_in  : in  std_logic_vector(5 downto 0);
            data_out : out std_logic_vector(3 downto 0)
        );
    end component;

begin

    uut: s1_box
        port map (
            data_in  => data_in,
            data_out => data_out
        );

   
    testprocess: process
    begin
        data_in <= "010010";  -- Example input for s1_box, representing binary value for row and column selection
        wait for 10 ns;
        
    end process testprocess;
end architecture behavior;

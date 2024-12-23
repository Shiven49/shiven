library ieee;
use ieee.std_logic_1164.all;

entity test_split_48_bits_to_8x6 is
end test_split_48_bits_to_8x6;

architecture behavior of test_split_48_bits_to_8x6 is

 component split_48_bits_to_8x6 is
        port(
            data_in    : in  std_logic_vector(47 downto 0);
            data_out_1 : out std_logic_vector(5 downto 0);
            data_out_2 : out std_logic_vector(5 downto 0);
            data_out_3 : out std_logic_vector(5 downto 0);
            data_out_4 : out std_logic_vector(5 downto 0);
            data_out_5 : out std_logic_vector(5 downto 0);
            data_out_6 : out std_logic_vector(5 downto 0);
            data_out_7 : out std_logic_vector(5 downto 0);
            data_out_8 : out std_logic_vector(5 downto 0)
        );
    end component;

    
    signal data_in    : std_logic_vector(47 downto 0);
    signal data_out_1 : std_logic_vector(5 downto 0);
    signal data_out_2 : std_logic_vector(5 downto 0);
    signal data_out_3 : std_logic_vector(5 downto 0);
    signal data_out_4 : std_logic_vector(5 downto 0);
    signal data_out_5 : std_logic_vector(5 downto 0);
    signal data_out_6 : std_logic_vector(5 downto 0);
    signal data_out_7 : std_logic_vector(5 downto 0);
    signal data_out_8 : std_logic_vector(5 downto 0);

    
   

begin


    uut: split_48_bits_to_8x6 
        port map (
            data_in     => data_in,
            data_out_1  => data_out_1,
            data_out_2  => data_out_2,
            data_out_3  => data_out_3,
            data_out_4  => data_out_4,
            data_out_5  => data_out_5,
            data_out_6  => data_out_6,
            data_out_7  => data_out_7,
            data_out_8  => data_out_8
        );

    -- Test Process
    testprocess: process
    begin
        data_in <= "000000111111000000111111000000111111000000111111";
        wait for 10 ns;
        
        
    end process testprocess;

end architecture behavior;

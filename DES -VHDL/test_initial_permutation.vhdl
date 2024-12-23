library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity test_initial_permutation is
end test_initial_permutation;

architecture behavior of test_initial_permutation is

  
    component initial_permutation
        port (
            data_in: in std_logic_vector(63 downto 0);
            permuted_right_half: out std_logic_vector(31 downto 0);
            permuted_left_half: out std_logic_vector(31 downto 0)
        );
    end component;

   
    signal data_in: std_logic_vector(63 downto 0);
    signal permuted_right_half: std_logic_vector(31 downto 0);
    signal permuted_left_half: std_logic_vector(31 downto 0);

begin

    -- Instantiate the Unit Under Test (UUT) as a component
    uut: initial_permutation
        port map (
            data_in => data_in,
            permuted_right_half => permuted_right_half,
            permuted_left_half => permuted_left_half
        );

    -- Test process
    testprocess: process
    begin
        -- Test case : Apply input and observe output
        data_in <= "0101011011101001100111101010110011011110010111111111010010110001";
        wait for 10 ns;

        
    end process testprocess;
end architecture behavior;

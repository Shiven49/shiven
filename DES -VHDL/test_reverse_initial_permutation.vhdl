library ieee;
use ieee.std_logic_1164.all;

entity test_reverse_initial_permutation is
end entity test_reverse_initial_permutation;

architecture behavior of test_reverse_initial_permutation is


    component reverse_initial_permutation
        port (
            permuted_left_half: in std_logic_vector(31 downto 0);
            permuted_right_half: in std_logic_vector(31 downto 0);
            data_out: out std_logic_vector(63 downto 0)
        );
    end component;


    signal permuted_left_half: std_logic_vector(31 downto 0);
    signal permuted_right_half: std_logic_vector(31 downto 0);
    signal data_out: std_logic_vector(63 downto 0);

begin

   
    uut: reverse_initial_permutation
        port map (
            permuted_left_half => permuted_left_half,
            permuted_right_half => permuted_right_half,
            data_out => data_out
        );

    -- Test process
    
end architecture behavior;

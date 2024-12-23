library ieee;
use ieee.std_logic_1164.all;


use work.all;

entity test_permutation_p is
end entity test_permutation_p;

architecture behavior of test_permutation_p is

   
    signal data_in  : std_logic_vector(31 downto 0);
    signal data_out : std_logic_vector(31 downto 0);


    component permutation_p
        port (
            data_in  : in  std_logic_vector(31 downto 0);  
            data_out : out std_logic_vector(31 downto 0)
        );
    end component;

begin

    -- Component Instantiation
    uut: permutation_p
        port map (
            data_in  => data_in,
            data_out => data_out
        );

end architecture behavior;

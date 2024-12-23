library ieee;
use ieee.std_logic_1164.all;

entity test_xor_32_bits is
end entity test_xor_32_bits;

architecture behavior of test_xor_32_bits is
    
    component xor_32_bits
        port (
            data_in  : in  std_logic_vector(0 to 31);
            lhs_bits : in  std_logic_vector(0 to 31);
            data_out : out std_logic_vector(0 to 31)
        );
    end component;

    -- Signal declarations
    signal data_in  : std_logic_vector(0 to 31);
    signal lhs_bits : std_logic_vector(0 to 31);
    signal data_out : std_logic_vector(0 to 31);

begin

    uut: xor_32_bits
        port map (
            data_in  => data_in,
            lhs_bits => lhs_bits,
            data_out => data_out
        );

    -- Process to apply test vectors
   
end architecture behavior;

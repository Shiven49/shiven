library ieee;
use ieee.std_logic_1164.all;

entity test_xor_48_bits is
end entity test_xor_48_bits;

architecture behavior of test_xor_48_bits is

   
    component xor_48_bits
        port (
            data_in: in std_logic_vector(47 downto 0);
            key: in std_logic_vector(47 downto 0);
            data_out: out std_logic_vector(47 downto 0)
        );
    end component;

  
    signal data_in: std_logic_vector(47 downto 0);
    signal key: std_logic_vector(47 downto 0);
    signal data_out: std_logic_vector(47 downto 0);

begin

  
    uut: xor_48_bits port map (
            data_in => data_in,
            key => key,
            data_out => data_out
        );

   
    
end architecture behavior;

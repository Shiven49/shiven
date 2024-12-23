library ieee;
use ieee.std_logic_1164.all;

entity test_expand is
end entity test_expand;

architecture behavior of test_expand is

   
    component expand
        port (
            data_in: in std_logic_vector(31 downto 0);
            data_out: out std_logic_vector(47 downto 0)
        );
    end component;

   
    signal data_in: std_logic_vector(31 downto 0);
    signal data_out: std_logic_vector(47 downto 0);

begin

    
    uut: expand port map (
            data_in => data_in,
            data_out => data_out
        );

   
   
end architecture behavior;

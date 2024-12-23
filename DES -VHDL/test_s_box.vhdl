library ieee;
use ieee.std_logic_1164.all;
use work.all;

entity test_s_box is
end test_s_box;

architecture behavior of test_s_box is
   
    signal data_in  : std_logic_vector(47 downto 0);
    signal data_out : std_logic_vector(31 downto 0);

   
    component s_box
        port (
            data_in  : in  std_logic_vector(47 downto 0);
            data_out : out std_logic_vector(31 downto 0)
        );
    end component;

begin
   
    uut: s_box
        port map (
            data_in  => data_in,
            data_out => data_out
        );

   
    
end architecture behavior;

library ieee;
use ieee.std_logic_1164.all;

entity s_box is
    port (
        data_in  : in  std_logic_vector(47 downto 0);
        data_out : out std_logic_vector(31 downto 0)
    );
end entity s_box;

architecture behavior of s_box is

    -- Component declarations for each S-Box
    component s1_box
        port (
            data_in  : in  std_logic_vector(5 downto 0);
            data_out : out std_logic_vector(3 downto 0)
        );
    end component;

    component s2_box
        port (
            data_in  : in  std_logic_vector(5 downto 0);
            data_out : out std_logic_vector(3 downto 0)
        );
    end component;

    component s3_box
        port (
            data_in  : in  std_logic_vector(5 downto 0);
            data_out : out std_logic_vector(3 downto 0)
        );
    end component;

    component s4_box
        port (
            data_in  : in  std_logic_vector(5 downto 0);
            data_out : out std_logic_vector(3 downto 0)
        );
    end component;

    component s5_box
        port (
            data_in  : in  std_logic_vector(5 downto 0);
            data_out : out std_logic_vector(3 downto 0)
        );
    end component;

    component s6_box
        port (
            data_in  : in  std_logic_vector(5 downto 0);
            data_out : out std_logic_vector(3 downto 0)
        );
    end component;

    component s7_box
        port (
            data_in  : in  std_logic_vector(5 downto 0);
            data_out : out std_logic_vector(3 downto 0)
        );
    end component;

    component s8_box
        port (
            data_in  : in  std_logic_vector(5 downto 0);
            data_out : out std_logic_vector(3 downto 0)
        );
    end component;

begin
    -- Map each segment of `data_in` to corresponding S-Box component
    s1: s1_box
        port map (
            data_in  => data_in(47 downto 42),
            data_out => data_out(31 downto 28)
        );

    s2: s2_box
        port map (
            data_in  => data_in(41 downto 36),
            data_out => data_out(27 downto 24)
        );

    s3: s3_box
        port map (
            data_in  => data_in(35 downto 30),
            data_out => data_out(23 downto 20)
        );

    s4: s4_box
        port map (
            data_in  => data_in(29 downto 24),
            data_out => data_out(19 downto 16)
        );

    s5: s5_box
        port map (
            data_in  => data_in(23 downto 18),
            data_out => data_out(15 downto 12)
        );

    s6: s6_box
        port map (
            data_in  => data_in(17 downto 12),
            data_out => data_out(11 downto 8)
        );

    s7: s7_box
        port map (
            data_in  => data_in(11 downto 6),
            data_out => data_out(7 downto 4)
        );

    s8: s8_box
        port map (
            data_in  => data_in(5 downto 0),
            data_out => data_out(3 downto 0)
        );

end architecture behavior;

library ieee;
use ieee.std_logic_1164.all;

entity expand is
    port (
        data_in  : in  std_logic_vector(31 downto 0);  -- Changed range notation to 31 downto 0
        data_out : out std_logic_vector(47 downto 0)
    );
end entity expand;

architecture behavior of expand is
begin
    -- Directly mapping each bit in `data_out` to the expanded pattern of `data_in`
    data_out(0)  <= data_in(31);
    data_out(1)  <= data_in(0);
    data_out(2)  <= data_in(1);
    data_out(3)  <= data_in(2);
    data_out(4)  <= data_in(3);
    data_out(5)  <= data_in(4);

    data_out(6)  <= data_in(3);
    data_out(7)  <= data_in(4);
    data_out(8)  <= data_in(5);
    data_out(9)  <= data_in(6);
    data_out(10) <= data_in(7);
    data_out(11) <= data_in(8);

    data_out(12) <= data_in(7);
    data_out(13) <= data_in(8);
    data_out(14) <= data_in(9);
    data_out(15) <= data_in(10);
    data_out(16) <= data_in(11);
    data_out(17) <= data_in(12);

    data_out(18) <= data_in(11);
    data_out(19) <= data_in(12);
    data_out(20) <= data_in(13);
    data_out(21) <= data_in(14);
    data_out(22) <= data_in(15);
    data_out(23) <= data_in(16);

    data_out(24) <= data_in(15);
    data_out(25) <= data_in(16);
    data_out(26) <= data_in(17);
    data_out(27) <= data_in(18);
    data_out(28) <= data_in(19);
    data_out(29) <= data_in(20);

    data_out(30) <= data_in(19);
    data_out(31) <= data_in(20);
    data_out(32) <= data_in(21);
    data_out(33) <= data_in(22);
    data_out(34) <= data_in(23);
    data_out(35) <= data_in(24);

    data_out(36) <= data_in(23);
    data_out(37) <= data_in(24);
    data_out(38) <= data_in(25);
    data_out(39) <= data_in(26);
    data_out(40) <= data_in(27);
    data_out(41) <= data_in(28);

    data_out(42) <= data_in(27);
    data_out(43) <= data_in(28);
    data_out(44) <= data_in(29);
    data_out(45) <= data_in(30);
    data_out(46) <= data_in(31);
    data_out(47) <= data_in(0);

end architecture behavior;

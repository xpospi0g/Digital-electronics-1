library ieee;
use ieee.std_logic_1164.all;


entity tb_stlc is
    -- Entity of testbench is always empty
end entity tb_stlc;


architecture testbench of tb_stlc is

    -- Local constants
    constant c_CLK_100MHZ_PERIOD : time := 10 ns;

    --Local signals
    signal s_clk_100MHz : std_logic;
    signal s_reset      : std_logic;
    signal s_sen_south  : std_logic;
    signal s_sen_west   : std_logic;
    signal s_south      : std_logic_vector(3 - 1 downto 0);
    signal s_west       : std_logic_vector(3 - 1 downto 0);

begin
    -- Connecting testbench signals with tlc entity (Unit Under Test)
    uut_tlc : entity work.stlc
        port map(
            clk     => s_clk_100MHz,
            reset   => s_reset,
            south_i => s_sen_south,
            west_i  => s_sen_west,
            south_o => s_south,
            west_o  => s_west
        );


    p_clk_gen : process
    begin
        while now < 10000 ns loop   -- 10 usec of simulation
            s_clk_100MHz <= '0';
            wait for c_CLK_100MHZ_PERIOD / 2;
            s_clk_100MHz <= '1';
            wait for c_CLK_100MHZ_PERIOD / 2;
        end loop;
        wait;
    end process p_clk_gen;

  
    p_reset_gen : process
    begin
        s_reset <= '0'; wait for 200 ns;
        -- Reset activated
        s_reset <= '1'; wait for 300 ns;
        -- Reset deactivated
        s_reset <= '0';
        wait;
    end process p_reset_gen;


    p_stimulus : process
    begin
        wait for 600 ns;
        s_sen_south <= '0'; s_sen_west <= '0'; wait for 50 ns;
        s_sen_south <= '0'; s_sen_west <= '1'; wait for 50 ns;
        s_sen_south <= '0'; s_sen_west <= '0'; wait for 150 ns;
        s_sen_south <= '1'; s_sen_west <= '0'; wait for 50 ns;
        s_sen_south <= '0'; s_sen_west <= '0'; wait for 150 ns;
        s_sen_south <= '0'; s_sen_west <= '1'; wait for 100 ns;
        s_sen_south <= '1'; s_sen_west <= '0'; wait for 100 ns;
        s_sen_south <= '1'; s_sen_west <= '1'; wait for 200 ns;
        wait;
    end process p_stimulus;

end architecture testbench;
--                           *** TESTING OF MULTIPLIER CELLS ***
--                      Needs 10 clocks to perform. (for some reason?).
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
                                                                 -- **********************************
ENTITY test IS                                                   -- * DECLARINGS                     *
   PORT (                                                        -- **********************************
         CLK      :   IN    STD_LOGIC;                           -- * Incoming Clock     : KEY  0    *
         A        :   IN    STD_LOGIC_VECTOR( 3 DOWNTO 0 );      -- * Incoming A         : SW[7:4]   *
         B        :   IN    STD_LOGIC_VECTOR( 3 DOWNTO 0 );      -- * Incoming B         : SW[3:0]   *
         result   :   OUT   STD_LOGIC_VECTOR( 7 DOWNTO 0 )       -- * Outgoing result    : LEDR[7:0] *
      );                                                         -- **********************************
END test;

ARCHITECTURE mult4 OF test IS                                    -- *** Multplies 4 x 4 bits. Using 2 cells. ***
   SIGNAL   bFF     :   STD_LOGIC_VECTOR( 1 DOWNTO 0 );          -- flops for Bs leftMostCell has 0, to right then 1-2-3.7
   SIGNAL   nextB   :   STD_LOGIC;                               -- The next incoming B for the right most cell
   SIGNAL   sum     :   STD_LOGIC_VECTOR( 1 DOWNTO 0 );          -- The sums from each of the cells, starting with 0 from the left. 
BEGIN
   -- from left to right... B-flipflops : 0-1-2-3
   leftMostCell : WORK.mult_cell(mult2)
         PORT MAP ( 
                    a1 => A(3),                                  -- Gets the two most significant bits of A
                    a2 => A(2), 
                   bIn => bFF(1),                                -- Gets the B inside the B-flipflop of the cell next door.
                   bff => bFF(0),                                -- Gets the B inside the B-flipflop of itself. This is also reassigned to be Bin at the end.
                   sIn => '0',                                   -- Left most cell gets by standard 0.
                  sOut => sum(0),                                -- Outputs to its sum.
                   clk => CLK 
                  );                                             -- Clock
   secondCell : WORK.mult_cell(mult2)
         PORT MAP ( a1 => A(1),                                  -- Gets the two least significant bits of A
                    a2 => A(0),
                   bIn => nextB,                                 -- Gets the upcoming B which is inside NO B-flipflops.
                   bff => bFF(1),                                -- Gets the B inside the B-flipflop of itself. This is also reassigned to be Bin at the end.
                   sIn => sum(0),                                -- Gets the sum from the left most cell.
                  sOut => sum(1),                                -- Outputs its own sum
                   clk => CLK                                    -- Clock
                  );                                

   BFF0 : WORK.ListB(getB)                                       -- *** shift for next B ***
         PORT MAP ( 
                      L => b,                                    -- Inputs B as ingoing list.
                    clk => CLK,                                  -- Clock
                   bOut => nextB                                 -- The upcoming B of the right most cell. 
                  );
                    
   RES0 : WORK.shift_register(shiftRight)                        -- *** Shiftregister of result ***
         PORT MAP ( 
                    d => sum(1),                                 -- Shifts in the sum of the right most cell.
                  clk => CLK,                                    -- Clock
                  res => result                                  -- Gets the result of the register of the sums.
                  );                               
END mult4;



--            *** MULTIPLIER CELL ***

LIBRARY ieee;
USE ieee.std_LOGIC_1164.all;
                                                                 -- *******************************
ENTITY mult_cell IS                                              -- * DECLARINGS                  *
   PORT (                                                        -- *******************************
         a1,a2   :   IN     STD_LOGIC;                           -- * Takes two As                *
         bIn     :   IN     STD_LOGIC;                           -- * Incoming B                  *
         bff     :  INOUT   STD_LOGIC;                           -- * B inside flipflop           *
         sIn     :   IN     STD_LOGIC;                           -- * Sum from neighbour          *
         sOut    :   OUT    STD_LOGIC;                           -- * Output result of this cell  *
         clk     :   IN     STD_LOGIC                            -- * Clock                       *
        );                                                       -- *******************************
END mult_cell;

ARCHITECTURE mult2 OF mult_cell IS 
   SIGNAL   nLeft, nRight   :   STD_LOGIC;
   SIGNAL   p1, p2          :   STD_LOGIC;
   SIGNAL   c1, c2          :   STD_LOGIC;
   SIGNAL   c1ff, c2ff      :   STD_LOGIC;                       -- Signals for containing "temporary" bits.
BEGIN

   nLeft <= (a1 AND bff);                                        -- Left AND gate
   nRight <= (a2 AND bIn);                                       -- Right AND gate

   flipflopB : work.dflipflop(flip)                              -- Flips Bin into B at next clock.
         PORT MAP ( 
                    d => bIn,
                  CLK => clk,
                    q => bff 
                   );
               
   flipflopC1 : WORK.dflipflop(flip)                             -- Flips c1 (see below) into c1-flipflop at next clock.
         PORT MAP ( 
                    d => c1,
                  CLK => clk,
                    q => c1ff 
                  );
                    
   flipflopC2 : WORK.dflipflop(flip)                             -- Flips c2 (see below) into c2-flipflop at next clock.
         PORT MAP ( 
                    d => c2,
                  CLK => clk,
                    q => c2ff 
                  );
                    
   flipflopS : WORK.dflipflop(flip)                              -- Flips p2 (see below) into Sout-flipflop at next clock.
         PORT MAP ( 
                    d => p2,
                  CLK => clk,
                    q => sOut
                  );
                    
   
   
   fullAdder1 : WORK.fullAdder(add)                              -- Left full adder.
         PORT MAP ( 
                    a => nLeft,                                  -- Result of left AND gate.
                    b => sIn,                                    -- Sum from neighbour cell.
                  cIn => c1ff,                                   -- carry from last cycle.
                    s => p1,                                     -- Produces output product : p1 (going to right full adder).
                 cOut => c1                                      -- Produces output carry   : c1 (going to c1-flipflop above).
                  );                                   
						  
   fullAdder2 : WORK.fullAdder(add)                              -- Rught full adder.
         PORT MAP ( 
                    a => nRight,                                 -- Result of right AND gate
                    b => p1,                                     -- Result of left full adder.
                  cIn => c2ff,                                   -- carry from last cycle.
                    s => p2,                                     -- Produces output product : p2 (going to Sout above).
                 cOut => c2                                      -- Produces output carry   : c2 (going to c2-flipflop above).
                  );                               
END mult2;





LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
                                                                 -- **********************************
ENTITY fullAdder IS                                              -- * DECLARINGS                     *
   PORT (                                                        -- **********************************
         a      :   IN    STD_LOGIC;                             -- * Takes two inputs A and B.      *
         b      :   IN    STD_LOGIC;                             -- *                                *         
         cIn    :   IN    STD_LOGIC;                             -- * Takes a carry from last cycle. *
         s      :   OUT   STD_LOGIC;                             -- * Produces a sum                 *
         cOut   :   OUT   STD_LOGIC                              -- * and a carry for next cycle.    *
      );                                                         -- **********************************
END fullAdder;

ARCHITECTURE add OF fullAdder IS
BEGIN 
   s <= ((a XOR b) XOR cIn);                                    -- Sum
   cOut <= (a AND b) OR (cIn AND (a XOR B));                    -- carry
END add;




LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
                                                               -- ****************************
ENTITY shift_register IS                                       -- * DECLARINGS               *
    PORT (                                                     -- ****************************
           d     :   IN    STD_LOGIC;                          -- * Takes a bit d            *
           clk   :   IN    STD_LOGIC;                          -- * Clock                    *
           res   :   OUT   STD_LOGIC_VECTOR( 7 DOWNTO 0 )      -- * Produces a shiftregister *
          );                                                   -- ****************************
END shift_register;
    
ARCHITECTURE shiftRight of shift_register IS
   SIGNAL   shift_reg   :   STD_LOGIC_VECTOR( 7 DOWNTO 0 );    -- Defines a working vector for the register.
BEGIN                   -- *** EVERYTHING BELOW HAPPENS AT THE SAME TIME!!! ***

      flip0 : WORK.dflipflop(flip)                             -- Uses a flipflop to assign left most flipflop (index 7) of register, at next cycle, to incoming value d.
      PORT MAP ( 
                 clk => clk,
                   d => d,
                   q => shift_reg(7) );
                   
      floop : FOR i IN 6 DOWNTO 0 GENERATE                     -- Uses a for loop to shift the 
               FFi : WORK.dflipflop(flip)
                     PORT MAP ( 
                                d => shift_reg( i+1 ),         -- Takes value from previous flipflop
                              clk => clk,
                                q => shift_reg( i ) 
                              );                               -- Puts it in the working flopflop at next cycle.
              END GENERATE;
              
   res <= shift_reg;                                           -- Copies the shiftregister to the output RES.
END shiftRight;



--            *** Entity to get the next B for the right most cell ***

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
                                                               -- ****************************************
ENTITY ListB IS                                                -- * DECLARINGS                           *
   PORT (                                                      -- ****************************************
          L      :   IN   STD_LOGIC_VECTOR( 3 DOWNTO 0 );      -- * Takes a list, B from top-level input *
          bOut   :   OUT   STD_LOGIC;                          -- * Spits out a bit                      *
          clk    :   IN    STD_LOGIC                           -- * Clock                                *
         );                                                    -- ****************************************
END ListB;

ARCHITECTURE getB of ListB IS
   SIGNAL   LTemp   :   STD_LOGIC_VECTOR( 3 DOWNTO 0 )   :=   L;      -- Signal for storing B-vector
   SIGNAL   i       :   INTEGER                          :=   0;      -- Signal for indexing B-vector
BEGIN
   PROCESS IS
   BEGIN
      IF ( i < 4 ) THEN                                        -- If cycle index < 4 (in range of B-vector)
         bOut <= LTemp(i);                                     -- Bout is assigned to Ltemp of index i.
      ELSE
         bOut <= '0';                                          -- Otherwise Bout is assigned to 0 (for the last cycles).
      END IF;
      
      WAIT UNTIL RISING_EDGE(clk);                             -- Waits until next cycle to increment i
         i <= i + 1;
   END PROCESS;
END getB;



--          *** D-FlipFlop ***

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
                                                               -- *******************************
ENTITY dflipflop IS                                            -- * DECLARINGS                  *
   PORT (                                                      -- *******************************
      d     :   IN    STD_LOGIC;                               -- * Takes an input d and clock  *
      clk   :   IN    STD_LOGIC;                               -- *                             *
      q     :   OUT   STD_LOGIC                                -- * Outputs to q                *
      );                                                       -- *******************************
END dflipflop;

ARCHITECTURE flip OF dflipflop IS
BEGIN
   PROCESS IS
   BEGIN
      WAIT UNTIL ( RISING_EDGE ( clk ) );                      -- Waits until next clock
         q <= d;                                               -- Then outputs d into q
   END PROCESS;
END ARCHITECTURE flip;
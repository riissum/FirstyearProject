LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
                                                                
ENTITY test IS                                                  
   PORT (                                                        
         CLK      :   IN    STD_LOGIC;                           
         A        :   IN    STD_LOGIC_VECTOR( 3 DOWNTO 0 );      
         B        :   IN    STD_LOGIC_VECTOR( 3 DOWNTO 0 );      
         result   :   OUT   STD_LOGIC_VECTOR( 7 DOWNTO 0 )       
      );                                                         
END test;

ARCHITECTURE modMult4 OF test IS                                    
         
BEGIN                           
END modMult4;



LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
                                                                 
ENTITY fullAdder IS                                              
   PORT (                                                        
         a      :   IN    STD_LOGIC;                             
         b      :   IN    STD_LOGIC;                                      
         cIn    :   IN    STD_LOGIC;                             
         s      :   OUT   STD_LOGIC;                            
         cOut   :   OUT   STD_LOGIC                              
      );                                                       
END fullAdder;

ARCHITECTURE add OF fullAdder IS
BEGIN 
   s <= ((a XOR b) XOR cIn);                                   
   cOut <= (a AND b) OR (cIn AND (a XOR B));                   
END add;




LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
                                                             
ENTITY shift_register IS                                    
    PORT (                                                    
           d     :   IN    STD_LOGIC;                          
           clk   :   IN    STD_LOGIC;                         
           res   :   OUT   STD_LOGIC_VECTOR( 7 DOWNTO 0 )      
          );                                                   
END shift_register;
    
ARCHITECTURE shiftRight of shift_register IS
   SIGNAL   shift_reg   :   STD_LOGIC_VECTOR( 7 DOWNTO 0 );    
BEGIN                   

      flip0 : WORK.dflipflop(flip)                             
      PORT MAP ( 
                 clk => clk,
                   d => d,
                   q => shift_reg(7) );
                   
      floop : FOR i IN 6 DOWNTO 0 GENERATE                      
               FFi : WORK.dflipflop(flip)
                     PORT MAP ( 
                                d => shift_reg( i+1 ),         
                              clk => clk,
                                q => shift_reg( i ) 
                              );                               
              END GENERATE;
              
   res <= shift_reg;                                           
END shiftRight;

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
                                                               
ENTITY ListB IS                                               
   PORT (                                                     
          L      :   IN   STD_LOGIC_VECTOR( 3 DOWNTO 0 );      
          bOut   :   OUT   STD_LOGIC;                          
          clk    :   IN    STD_LOGIC                           
         );                                                    
END ListB;

ARCHITECTURE getB of ListB IS
   SIGNAL   LTemp   :   STD_LOGIC_VECTOR( 3 DOWNTO 0 )   :=   L;      
   SIGNAL   i       :   INTEGER                          :=   0;     
BEGIN
   PROCESS IS
   BEGIN
      IF ( i < 4 ) THEN                                        
         bOut <= LTemp(i);                                     
      ELSE
         bOut <= '0';                                         
      END IF;
      
      WAIT UNTIL RISING_EDGE(clk);                             
         i <= i + 1;
   END PROCESS;
END getB;

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
                                                              
ENTITY dflipflop IS                                            
   PORT (                                                     
      d     :   IN    STD_LOGIC;                              
      clk   :   IN    STD_LOGIC;                              
      q     :   OUT   STD_LOGIC                              
      );                                                       
END dflipflop;

ARCHITECTURE flip OF dflipflop IS
BEGIN
   PROCESS IS
   BEGIN
      WAIT UNTIL ( RISING_EDGE ( clk ) );                      
         q <= d;                                            
   END PROCESS;
END ARCHITECTURE flip;
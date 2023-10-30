LIBRARY IEEE;
USE IEEE.Std_logic_1164.all;
LIBRARY IEEE;
USE IEEE.VITAL_Timing.all;
USE IEEE.VITAL_Primitives.all;

package prim is

CONSTANT DefCombSpikeMsgOn : BOOLEAN := true;
CONSTANT DefCombSpikeXOn   : BOOLEAN := true;
CONSTANT DefSeqMsgOn       : BOOLEAN := true;
CONSTANT DefSeqXOn         : BOOLEAN := true;

CONSTANT DefDummyDelay    : VitalDelayType := 1.00 ns;
CONSTANT DefDummySetup    : VitalDelayType := 1.00 ns;
CONSTANT DefDummyHold     : VitalDelayType := 1.00 ns;
CONSTANT DefDummyWidth    : VitalDelayType := 1.00 ns;
CONSTANT DefDummyRecovery : VitalDelayType := 1.00 ns;
CONSTANT DefDummyRemoval  : VitalDelayType := 1.00 ns;
CONSTANT DefDummyIpd      : VitalDelayType := 0.00 ns;
CONSTANT DefDummyIsd      : VitalDelayType := 0.00 ns;
CONSTANT DefDummyIcd      : VitalDelayType := 0.00 ns;

CONSTANT udp_dff : VitalStateTableType (1 TO 21, 1 TO 7) := (
--    NOTIFIER   D      CLK     RN       S      Q(t)   Q(t+1)
     (  'X',    '-',    '-',    '-',    '-',    '-',    'X'  ),
     (  '-',    '-',    '-',    '-',    '1',    '-',    '1'  ),
     (  '-',    '-',    '-',    '1',    '0',    '-',    '0'  ),
     (  '-',    '0',    '/',    '-',    '0',    '-',    '0'  ),
     (  '-',    '1',    '/',    '0',    '-',    '-',    '1'  ),
     (  '-',    '1',    '*',    '0',    '-',    '1',    '1'  ),
     (  '-',    '0',    '*',    '-',    '0',    '0',    '0'  ),
     (  '-',    '-',    '\',   '-',    '-',    '-',    'S'  ),
     (  '-',    '*',    'B',    '-',    '-',    '-',    'S'  ),
     (  '-',    '-',    'B',    '0',    '*',    '1',    '1'  ),
     (  '-',    '1',    'X',    '0',    '*',    '1',    '1'  ),
     (  '-',    '-',    'B',    '*',    '0',    '0',    '0'  ),
     (  '-',    '0',    'X',    '*',    '0',    '0',    '0'  ),
     (  '-',    'B',    'r',    '-',    '-',    '-',    'X'  ),
     (  '-',    '/',    'X',    '-',    '-',    '-',    'X'  ),
     (  '-',    '-',    '-',    '-',    '*',    '-',    'X'  ),
     (  '-',    '-',    '-',    '*',    '-',    '-',    'X'  ),
     (  '-',    '-',    'f',    '-',    '-',    '-',    'X'  ),
     (  '-',    '\',   'X',    '0',    '-',    '-',    'X'  ),
     (  '-',    'B',    'X',    '-',    '-',    '-',    'S'  ),
     (  '-',    '-',    'S',    '-',    '-',    '-',    'S'  ));

CONSTANT udp_tlat : VitalStateTableType (1 TO 20, 1 TO 7) := (
--      NOT      D       G       R       S      Q(t)  Q(t+1)
     (  'X',    '-',    '-',    '-',    '-',    '-',    'X'  ),
     (  '-',    '-',    '-',    '-',    '1',    '-',    '1'  ),
     (  '-',    '-',    '-',    '1',    '0',    '-',    '0'  ),
     (  '-',    '1',    '1',    '0',    '-',    '-',    '1'  ),
     (  '-',    '0',    '1',    '-',    '0',    '-',    '0'  ),
     (  '-',    '1',    '*',    '0',    '-',    '1',    '1'  ),
     (  '-',    '0',    '*',    '-',    '0',    '0',    '0'  ),
     (  '-',    '*',    '0',    '-',    '-',    '-',    'S'  ),
     (  '-',    '-',    '0',    '0',    '*',    '1',    '1'  ),
     (  '-',    '1',    '-',    '0',    '*',    '1',    '1'  ),
     (  '-',    '-',    '0',    '*',    '0',    '0',    '0'  ),
     (  '-',    '0',    '-',    '*',    '0',    '0',    '0'  ),
     (  '-',    '0',    '-',    '-',    '0',    '0',    '0'  ),
     (  '-',    '1',    '-',    '0',    '-',    '1',    '1'  ),
     (  '-',    '*',    '-',    '-',    '-',    '-',    'X'  ),
     (  '-',    '-',    '-',    '*',    '-',    '-',    'X'  ),
     (  '-',    '-',    '-',    '-',    '*',    '-',    'X'  ),
     (  '-',    'B',    'r',    '0',    '0',    '-',    'X'  ),
     (  '-',    'B',    'X',    '0',    '0',    '-',    'S'  ),
     (  '-',    '-',    'S',    '-',    '-',    '-',    'S'  ) );

CONSTANT udp_rslat : VitalStateTableType (1 TO 12, 1 TO 5) := (
--      NOT      R       S      Q(t)  Q(t+1)
     (  'X',    '-',    '-',    '-',    'X'  ),
     (  '-',    '-',    '1',    '-',    '1'  ),
     (  '-',    '1',    '0',    '-',    '0'  ),
     (  '-',    '0',    '-',    '1',    '1'  ),
     (  '-',    '-',    '0',    '0',    '0'  ),
     (  '-',    '-',    '-',    '-',    'S'  ),
     (  '-',    '0',    '*',    '1',    '1'  ),
     (  '-',    '*',    '0',    '0',    '0'  ),
     (  '-',    '-',    '0',    '0',    '0'  ),
     (  '-',    '0',    '-',    '1',    '1'  ),
     (  '-',    '*',    '-',    '-',    'X'  ),
     (  '-',    '-',    '*',    '-',    'X'  ) );


end prim;

package body prim is

end prim;
LIBRARY IEEE;
USE IEEE.Std_logic_1164.all;
USE IEEE.VITAL_Timing.all;
USE IEEE.VITAL_Primitives.all;
USE work.prim.all;

entity AND2X1 is
   generic (
             tipd_A : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tipd_B : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tpd_A_Y : VitalDelayType01 := (0.108267 ns, 0.123474 ns);
             tpd_B_Y : VitalDelayType01 := (0.107423 ns, 0.137572 ns);

             XOn            : BOOLEAN := DefCombSpikeXOn;
             MsgOn          : BOOLEAN := DefCombSpikeMsgOn;
             instancePath   : STRING  := "*" );

   port (
         A : in std_ulogic := 'U' ;
         B : in std_ulogic := 'U' ;
         Y : out std_ulogic);

   attribute VITAL_LEVEL0 of AND2X1 : entity is TRUE;
end AND2X1;

architecture behavioral of AND2X1 is
   attribute VITAL_LEVEL1 of behavioral : architecture is TRUE;

   SIGNAL A_ipd : std_ulogic := 'X';
   SIGNAL B_ipd : std_ulogic := 'X';

begin

--Input Path Delays
WIREDELAY : BLOCK
BEGIN
   VitalWireDelay( A_ipd, A, tipd_A );
   VitalWireDelay( B_ipd, B, tipd_B );
END BLOCK;

VITALBehavior : PROCESS (A_ipd, B_ipd)


      -- functionality section variables
      VARIABLE Y_zd : std_ulogic;

      -- path delay section variables
      VARIABLE Y_GlitchData : VitalGlitchDataType;

      BEGIN
          -- Functionality section
          Y_zd := VitalAND2(A_ipd, B_ipd);


          -- Path delay section
          VitalPathDelay01(
               OutSignal     => Y,
               OutSignalName => "Y",
               OutTemp => Y_zd,
               Paths => (
                      0 => ( A_ipd'LAST_EVENT,
                             tpd_A_Y,
                             TRUE),
                      1 => ( B_ipd'LAST_EVENT,
                             tpd_B_Y,
                             TRUE)),
               GlitchData => Y_GlitchData,
               Mode  => OnEvent,
               XOn            => XOn,
               MsgOn          => MsgOn,
               MsgSeverity    => WARNING );


END PROCESS;

end behavioral;


LIBRARY IEEE;
USE IEEE.Std_logic_1164.all;
USE IEEE.VITAL_Timing.all;
USE IEEE.VITAL_Primitives.all;
USE work.prim.all;

entity AND2X2 is
   generic (
             tipd_A : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tipd_B : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tpd_A_Y : VitalDelayType01 := (0.13066 ns, 0.154045 ns);
             tpd_B_Y : VitalDelayType01 := (0.130915 ns, 0.172065 ns);

             XOn            : BOOLEAN := DefCombSpikeXOn;
             MsgOn          : BOOLEAN := DefCombSpikeMsgOn;
             instancePath   : STRING  := "*" );

   port (
         A : in std_ulogic := 'U' ;
         B : in std_ulogic := 'U' ;
         Y : out std_ulogic);

   attribute VITAL_LEVEL0 of AND2X2 : entity is TRUE;
end AND2X2;

architecture behavioral of AND2X2 is
   attribute VITAL_LEVEL1 of behavioral : architecture is TRUE;

   SIGNAL A_ipd : std_ulogic := 'X';
   SIGNAL B_ipd : std_ulogic := 'X';

begin

--Input Path Delays
WIREDELAY : BLOCK
BEGIN
   VitalWireDelay( A_ipd, A, tipd_A );
   VitalWireDelay( B_ipd, B, tipd_B );
END BLOCK;

VITALBehavior : PROCESS (A_ipd, B_ipd)


      -- functionality section variables
      VARIABLE Y_zd : std_ulogic;

      -- path delay section variables
      VARIABLE Y_GlitchData : VitalGlitchDataType;

      BEGIN
          -- Functionality section
          Y_zd := VitalAND2(A_ipd, B_ipd);


          -- Path delay section
          VitalPathDelay01(
               OutSignal     => Y,
               OutSignalName => "Y",
               OutTemp => Y_zd,
               Paths => (
                      0 => ( A_ipd'LAST_EVENT,
                             tpd_A_Y,
                             TRUE),
                      1 => ( B_ipd'LAST_EVENT,
                             tpd_B_Y,
                             TRUE)),
               GlitchData => Y_GlitchData,
               Mode  => OnEvent,
               XOn            => XOn,
               MsgOn          => MsgOn,
               MsgSeverity    => WARNING );


END PROCESS;

end behavioral;


LIBRARY IEEE;
USE IEEE.Std_logic_1164.all;
USE IEEE.VITAL_Timing.all;
USE IEEE.VITAL_Primitives.all;
USE work.prim.all;

entity AOI21X1 is
   generic (
             tipd_A : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tipd_B : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tipd_C : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tpd_A_Y : VitalDelayType01 := (0.0990146 ns, 0.0876178 ns);
             tpd_B_Y : VitalDelayType01 := (0.0843707 ns, 0.0861636 ns);
             tpd_C_Y : VitalDelayType01 := (0.0681752 ns, 0.0709542 ns);

             XOn            : BOOLEAN := DefCombSpikeXOn;
             MsgOn          : BOOLEAN := DefCombSpikeMsgOn;
             instancePath   : STRING  := "*" );

   port (
         A : in std_ulogic := 'U' ;
         B : in std_ulogic := 'U' ;
         C : in std_ulogic := 'U' ;
         Y : out std_ulogic);

   attribute VITAL_LEVEL0 of AOI21X1 : entity is TRUE;
end AOI21X1;

architecture behavioral of AOI21X1 is
   attribute VITAL_LEVEL1 of behavioral : architecture is TRUE;

   SIGNAL A_ipd : std_ulogic := 'X';
   SIGNAL B_ipd : std_ulogic := 'X';
   SIGNAL C_ipd : std_ulogic := 'X';

begin

--Input Path Delays
WIREDELAY : BLOCK
BEGIN
   VitalWireDelay( A_ipd, A, tipd_A );
   VitalWireDelay( B_ipd, B, tipd_B );
   VitalWireDelay( C_ipd, C, tipd_C );
END BLOCK;

VITALBehavior : PROCESS (A_ipd, B_ipd, C_ipd)


      -- functionality section variables
      VARIABLE n0_var : std_ulogic;
      VARIABLE n1_var : std_ulogic;
      VARIABLE Y_zd : std_ulogic;

      -- path delay section variables
      VARIABLE Y_GlitchData : VitalGlitchDataType;

      BEGIN
          -- Functionality section
          n0_var := VitalAND2(A_ipd, B_ipd);
          n1_var := VitalOR2(n0_var, C_ipd);
          Y_zd := VitalINV(n1_var);


          -- Path delay section
          VitalPathDelay01(
               OutSignal     => Y,
               OutSignalName => "Y",
               OutTemp => Y_zd,
               Paths => (
                      0 => ( A_ipd'LAST_EVENT,
                             tpd_A_Y,
                             TRUE),
                      1 => ( B_ipd'LAST_EVENT,
                             tpd_B_Y,
                             TRUE),
                      2 => ( C_ipd'LAST_EVENT,
                             tpd_C_Y,
                             TRUE)),
               GlitchData => Y_GlitchData,
               Mode  => OnEvent,
               XOn            => XOn,
               MsgOn          => MsgOn,
               MsgSeverity    => WARNING );


END PROCESS;

end behavioral;


LIBRARY IEEE;
USE IEEE.Std_logic_1164.all;
USE IEEE.VITAL_Timing.all;
USE IEEE.VITAL_Primitives.all;
USE work.prim.all;

entity AOI22X1 is
   generic (
             tipd_A : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tipd_B : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tipd_C : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tipd_D : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tpd_A_Y : VitalDelayType01 := (0.111371 ns, 0.106909 ns);
             tpd_B_Y : VitalDelayType01 := (0.100585 ns, 0.106382 ns);
             tpd_C_Y : VitalDelayType01 := (0.0907619 ns, 0.0685509 ns);
             tpd_D_Y : VitalDelayType01 := (0.0780614 ns, 0.0682352 ns);

             XOn            : BOOLEAN := DefCombSpikeXOn;
             MsgOn          : BOOLEAN := DefCombSpikeMsgOn;
             instancePath   : STRING  := "*" );

   port (
         A : in std_ulogic := 'U' ;
         B : in std_ulogic := 'U' ;
         C : in std_ulogic := 'U' ;
         D : in std_ulogic := 'U' ;
         Y : out std_ulogic);

   attribute VITAL_LEVEL0 of AOI22X1 : entity is TRUE;
end AOI22X1;

architecture behavioral of AOI22X1 is
   attribute VITAL_LEVEL1 of behavioral : architecture is TRUE;

   SIGNAL A_ipd : std_ulogic := 'X';
   SIGNAL B_ipd : std_ulogic := 'X';
   SIGNAL C_ipd : std_ulogic := 'X';
   SIGNAL D_ipd : std_ulogic := 'X';

begin

--Input Path Delays
WIREDELAY : BLOCK
BEGIN
   VitalWireDelay( A_ipd, A, tipd_A );
   VitalWireDelay( B_ipd, B, tipd_B );
   VitalWireDelay( C_ipd, C, tipd_C );
   VitalWireDelay( D_ipd, D, tipd_D );
END BLOCK;

VITALBehavior : PROCESS (A_ipd, B_ipd, C_ipd, D_ipd)


      -- functionality section variables
      VARIABLE n0_var : std_ulogic;
      VARIABLE n1_var : std_ulogic;
      VARIABLE n2_var : std_ulogic;
      VARIABLE Y_zd : std_ulogic;

      -- path delay section variables
      VARIABLE Y_GlitchData : VitalGlitchDataType;

      BEGIN
          -- Functionality section
          n0_var := VitalAND2(A_ipd, B_ipd);
          n1_var := VitalAND2(C_ipd, D_ipd);
          n2_var := VitalOR2(n0_var, n1_var);
          Y_zd := VitalINV(n2_var);


          -- Path delay section
          VitalPathDelay01(
               OutSignal     => Y,
               OutSignalName => "Y",
               OutTemp => Y_zd,
               Paths => (
                      0 => ( A_ipd'LAST_EVENT,
                             tpd_A_Y,
                             TRUE),
                      1 => ( B_ipd'LAST_EVENT,
                             tpd_B_Y,
                             TRUE),
                      2 => ( C_ipd'LAST_EVENT,
                             tpd_C_Y,
                             TRUE),
                      3 => ( D_ipd'LAST_EVENT,
                             tpd_D_Y,
                             TRUE)),
               GlitchData => Y_GlitchData,
               Mode  => OnEvent,
               XOn            => XOn,
               MsgOn          => MsgOn,
               MsgSeverity    => WARNING );


END PROCESS;

end behavioral;


LIBRARY IEEE;
USE IEEE.Std_logic_1164.all;
USE IEEE.VITAL_Timing.all;
USE IEEE.VITAL_Primitives.all;
USE work.prim.all;

entity BUFX2 is
   generic (
             tipd_A : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tpd_A_Y : VitalDelayType01 := (0.133137 ns, 0.145384 ns);

             XOn            : BOOLEAN := DefCombSpikeXOn;
             MsgOn          : BOOLEAN := DefCombSpikeMsgOn;
             instancePath   : STRING  := "*" );

   port (
         A : in std_ulogic := 'U' ;
         Y : out std_ulogic);

   attribute VITAL_LEVEL0 of BUFX2 : entity is TRUE;
end BUFX2;

architecture behavioral of BUFX2 is
   attribute VITAL_LEVEL1 of behavioral : architecture is TRUE;

   SIGNAL A_ipd : std_ulogic := 'X';

begin

--Input Path Delays
WIREDELAY : BLOCK
BEGIN
   VitalWireDelay( A_ipd, A, tipd_A );
END BLOCK;

VITALBehavior : PROCESS (A_ipd)


      -- functionality section variables
      VARIABLE Y_zd : std_ulogic;

      -- path delay section variables
      VARIABLE Y_GlitchData : VitalGlitchDataType;

      BEGIN
          -- Functionality section
          Y_zd := VitalBUF(A_ipd);


          -- Path delay section
          VitalPathDelay01(
               OutSignal     => Y,
               OutSignalName => "Y",
               OutTemp => Y_zd,
               Paths => (
                      0 => ( A_ipd'LAST_EVENT,
                             tpd_A_Y,
                             TRUE)),
               GlitchData => Y_GlitchData,
               Mode  => OnEvent,
               XOn            => XOn,
               MsgOn          => MsgOn,
               MsgSeverity    => WARNING );


END PROCESS;

end behavioral;


LIBRARY IEEE;
USE IEEE.Std_logic_1164.all;
USE IEEE.VITAL_Timing.all;
USE IEEE.VITAL_Primitives.all;
USE work.prim.all;

entity BUFX4 is
   generic (
             tipd_A : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tpd_A_Y : VitalDelayType01 := (0.150497 ns, 0.162386 ns);

             XOn            : BOOLEAN := DefCombSpikeXOn;
             MsgOn          : BOOLEAN := DefCombSpikeMsgOn;
             instancePath   : STRING  := "*" );

   port (
         A : in std_ulogic := 'U' ;
         Y : out std_ulogic);

   attribute VITAL_LEVEL0 of BUFX4 : entity is TRUE;
end BUFX4;

architecture behavioral of BUFX4 is
   attribute VITAL_LEVEL1 of behavioral : architecture is TRUE;

   SIGNAL A_ipd : std_ulogic := 'X';

begin

--Input Path Delays
WIREDELAY : BLOCK
BEGIN
   VitalWireDelay( A_ipd, A, tipd_A );
END BLOCK;

VITALBehavior : PROCESS (A_ipd)


      -- functionality section variables
      VARIABLE Y_zd : std_ulogic;

      -- path delay section variables
      VARIABLE Y_GlitchData : VitalGlitchDataType;

      BEGIN
          -- Functionality section
          Y_zd := VitalBUF(A_ipd);


          -- Path delay section
          VitalPathDelay01(
               OutSignal     => Y,
               OutSignalName => "Y",
               OutTemp => Y_zd,
               Paths => (
                      0 => ( A_ipd'LAST_EVENT,
                             tpd_A_Y,
                             TRUE)),
               GlitchData => Y_GlitchData,
               Mode  => OnEvent,
               XOn            => XOn,
               MsgOn          => MsgOn,
               MsgSeverity    => WARNING );


END PROCESS;

end behavioral;


LIBRARY IEEE;
USE IEEE.Std_logic_1164.all;
USE IEEE.VITAL_Timing.all;
USE IEEE.VITAL_Primitives.all;
USE work.prim.all;

entity CLKBUF1 is
   generic (
             tipd_A : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tpd_A_Y : VitalDelayType01 := (0.224332 ns, 0.232224 ns);

             XOn            : BOOLEAN := DefCombSpikeXOn;
             MsgOn          : BOOLEAN := DefCombSpikeMsgOn;
             instancePath   : STRING  := "*" );

   port (
         A : in std_ulogic := 'U' ;
         Y : out std_ulogic);

   attribute VITAL_LEVEL0 of CLKBUF1 : entity is TRUE;
end CLKBUF1;

architecture behavioral of CLKBUF1 is
   attribute VITAL_LEVEL1 of behavioral : architecture is TRUE;

   SIGNAL A_ipd : std_ulogic := 'X';

begin

--Input Path Delays
WIREDELAY : BLOCK
BEGIN
   VitalWireDelay( A_ipd, A, tipd_A );
END BLOCK;

VITALBehavior : PROCESS (A_ipd)


      -- functionality section variables
      VARIABLE Y_zd : std_ulogic;

      -- path delay section variables
      VARIABLE Y_GlitchData : VitalGlitchDataType;

      BEGIN
          -- Functionality section
          Y_zd := VitalBUF(A_ipd);


          -- Path delay section
          VitalPathDelay01(
               OutSignal     => Y,
               OutSignalName => "Y",
               OutTemp => Y_zd,
               Paths => (
                      0 => ( A_ipd'LAST_EVENT,
                             tpd_A_Y,
                             TRUE)),
               GlitchData => Y_GlitchData,
               Mode  => OnEvent,
               XOn            => XOn,
               MsgOn          => MsgOn,
               MsgSeverity    => WARNING );


END PROCESS;

end behavioral;


LIBRARY IEEE;
USE IEEE.Std_logic_1164.all;
USE IEEE.VITAL_Timing.all;
USE IEEE.VITAL_Primitives.all;
USE work.prim.all;

entity CLKBUF2 is
   generic (
             tipd_A : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tpd_A_Y : VitalDelayType01 := (0.321199 ns, 0.331235 ns);

             XOn            : BOOLEAN := DefCombSpikeXOn;
             MsgOn          : BOOLEAN := DefCombSpikeMsgOn;
             instancePath   : STRING  := "*" );

   port (
         A : in std_ulogic := 'U' ;
         Y : out std_ulogic);

   attribute VITAL_LEVEL0 of CLKBUF2 : entity is TRUE;
end CLKBUF2;

architecture behavioral of CLKBUF2 is
   attribute VITAL_LEVEL1 of behavioral : architecture is TRUE;

   SIGNAL A_ipd : std_ulogic := 'X';

begin

--Input Path Delays
WIREDELAY : BLOCK
BEGIN
   VitalWireDelay( A_ipd, A, tipd_A );
END BLOCK;

VITALBehavior : PROCESS (A_ipd)


      -- functionality section variables
      VARIABLE Y_zd : std_ulogic;

      -- path delay section variables
      VARIABLE Y_GlitchData : VitalGlitchDataType;

      BEGIN
          -- Functionality section
          Y_zd := VitalBUF(A_ipd);


          -- Path delay section
          VitalPathDelay01(
               OutSignal     => Y,
               OutSignalName => "Y",
               OutTemp => Y_zd,
               Paths => (
                      0 => ( A_ipd'LAST_EVENT,
                             tpd_A_Y,
                             TRUE)),
               GlitchData => Y_GlitchData,
               Mode  => OnEvent,
               XOn            => XOn,
               MsgOn          => MsgOn,
               MsgSeverity    => WARNING );


END PROCESS;

end behavioral;


LIBRARY IEEE;
USE IEEE.Std_logic_1164.all;
USE IEEE.VITAL_Timing.all;
USE IEEE.VITAL_Primitives.all;
USE work.prim.all;

entity CLKBUF3 is
   generic (
             tipd_A : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tpd_A_Y : VitalDelayType01 := (0.420438 ns, 0.431168 ns);

             XOn            : BOOLEAN := DefCombSpikeXOn;
             MsgOn          : BOOLEAN := DefCombSpikeMsgOn;
             instancePath   : STRING  := "*" );

   port (
         A : in std_ulogic := 'U' ;
         Y : out std_ulogic);

   attribute VITAL_LEVEL0 of CLKBUF3 : entity is TRUE;
end CLKBUF3;

architecture behavioral of CLKBUF3 is
   attribute VITAL_LEVEL1 of behavioral : architecture is TRUE;

   SIGNAL A_ipd : std_ulogic := 'X';

begin

--Input Path Delays
WIREDELAY : BLOCK
BEGIN
   VitalWireDelay( A_ipd, A, tipd_A );
END BLOCK;

VITALBehavior : PROCESS (A_ipd)


      -- functionality section variables
      VARIABLE Y_zd : std_ulogic;

      -- path delay section variables
      VARIABLE Y_GlitchData : VitalGlitchDataType;

      BEGIN
          -- Functionality section
          Y_zd := VitalBUF(A_ipd);


          -- Path delay section
          VitalPathDelay01(
               OutSignal     => Y,
               OutSignalName => "Y",
               OutTemp => Y_zd,
               Paths => (
                      0 => ( A_ipd'LAST_EVENT,
                             tpd_A_Y,
                             TRUE)),
               GlitchData => Y_GlitchData,
               Mode  => OnEvent,
               XOn            => XOn,
               MsgOn          => MsgOn,
               MsgSeverity    => WARNING );


END PROCESS;

end behavioral;


LIBRARY IEEE;
USE IEEE.Std_logic_1164.all;
USE IEEE.VITAL_Timing.all;
USE IEEE.VITAL_Primitives.all;
USE work.prim.all;

entity DFFNEGX1 is
   generic (
             tipd_CLK : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             ticd_CLK : VitalDelayType := DefDummyIcd;
             tipd_D : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tisd_D_CLK : VitalDelayType := DefDummyIsd;
             tsetup_D_CLK_posedge_negedge : VitalDelayType := 0.28125 ns;
             tsetup_D_CLK_negedge_negedge : VitalDelayType := 0.28125 ns;
             thold_D_CLK_posedge_negedge : VitalDelayType := -0.0937499 ns;
             thold_D_CLK_negedge_negedge : VitalDelayType := -0.0937499 ns;
             tpw_CLK_posedge : VitalDelayType := 0.140686 ns;
             tpw_CLK_negedge : VitalDelayType := 0.163576 ns;
             tpd_CLK_Q : VitalDelayType01 := (0.202117 ns, 0.198542 ns);

             TimingChecksOn : BOOLEAN := false;
             XOn            : BOOLEAN := DefCombSpikeXOn;
             MsgOn          : BOOLEAN := DefCombSpikeMsgOn;
             instancePath   : STRING  := "*" );

   port (
         CLK : in std_ulogic := 'U' ;
         D : in std_ulogic := 'U' ;
         Q : out std_ulogic);

   attribute VITAL_LEVEL0 of DFFNEGX1 : entity is TRUE;
end DFFNEGX1;

architecture behavioral of DFFNEGX1 is
   attribute VITAL_LEVEL1 of behavioral : architecture is TRUE;

   SIGNAL CLK_dly : std_ulogic := 'X';
   SIGNAL CLK_ipd : std_ulogic := 'X';
   SIGNAL D_dly : std_ulogic := 'X';
   SIGNAL D_ipd : std_ulogic := 'X';

begin

--Input Path Delays
WIREDELAY : BLOCK
BEGIN
   VitalWireDelay( CLK_ipd, CLK, tipd_CLK );
   VitalWireDelay( D_ipd, D, tipd_D );
END BLOCK;

SIGNALDELAY : BLOCK
BEGIN
   VitalSignalDelay( CLK_dly, CLK_ipd, ticd_CLK );
   VitalSignalDelay( D_dly, D_ipd, tisd_D_CLK );
END BLOCK;

VITALBehavior : PROCESS (CLK_dly, D_dly)

      --timing checks section variables
      VARIABLE Tviol_D_CLK : std_ulogic := '0';
      VARIABLE TimeMarker_D_CLK : VitalTimingDataType := VitalTimingDataInit;
      VARIABLE PWviol_CLK : std_ulogic := '0';
      VARIABLE PeriodCheckInfo_CLK : VitalPeriodDataType;

      -- functionality section variables
      VARIABLE intclk : std_ulogic;
      VARIABLE n0_RN_dly : std_ulogic := '0';
      VARIABLE n0_SN_dly : std_ulogic := '0';
      VARIABLE DS0000 : std_ulogic;
      VARIABLE P0002 : std_ulogic;
      VARIABLE n0_vec : std_logic_vector( 1 TO 1 );
      VARIABLE PrevData_udp_dff_n0 : std_logic_vector( 0 TO 4 );
      VARIABLE Q_zd : std_ulogic;
      VARIABLE NOTIFIER : std_ulogic := '0';

      -- path delay section variables
      VARIABLE Q_GlitchData : VitalGlitchDataType;

      BEGIN
          -- Timing checks section
          IF (TimingChecksOn) THEN

                VitalSetupHoldCheck (
                    TestSignal     => D_dly,
                    TestSignalName => "D",
                    RefSignal      => CLK_dly,
                    RefSignalName  => "CLK",
                    SetupHigh      => tsetup_D_CLK_posedge_negedge,
                    SetupLow       => tsetup_D_CLK_negedge_negedge,
                    HoldHigh       => thold_D_CLK_negedge_negedge,
                    HoldLow        => thold_D_CLK_posedge_negedge,
                    CheckEnabled   => TRUE,
                    RefTransition  => 'F',
                    HeaderMsg      => InstancePath & "/DFFNEGX1",
                    TimingData     => TimeMarker_D_CLK,
                    Violation      => Tviol_D_CLK,
                    XOn            => DefSeqXOn,
                    MsgOn          => DefSeqMsgOn,
                    MsgSeverity    => WARNING );

                VitalPeriodPulseCheck (
                    TestSignal     => CLK_dly,
                    TestSignalName => "CLK",
                    Period         => 0 ps,
                    PulseWidthHigh => tpw_CLK_posedge,
                    PulseWidthLow  => tpw_CLK_negedge,
                    PeriodData     => PeriodCheckInfo_CLK,
                    Violation      => PWviol_CLK,
                    HeaderMsg      => InstancePath & "/DFFNEGX1",
                    CheckEnabled   => TRUE,
                    XOn            => DefSeqXOn,
                    MsgOn          => DefSeqMsgOn,
                    MsgSeverity    => WARNING );

          END IF;


          -- Functionality section
          NOTIFIER := (
                        Tviol_D_CLK OR
                        PWviol_CLK );

          intclk := VitalINV(CLK_dly);

          n0_RN_dly := '0';

          n0_SN_dly := '0';

          VitalStateTable ( StateTable => udp_dff,
                                DataIn => (NOTIFIER, D_dly, intclk, n0_RN_dly, n0_SN_dly),
                             NumStates => 1,
                                Result => n0_vec,
                        PreviousDataIn => PrevData_udp_dff_n0 );

          DS0000 := n0_vec(1);

          P0002 := VitalINV(DS0000);

          Q_zd := VitalBUF(DS0000);


          -- Path delay section
          VitalPathDelay01(
               OutSignal     => Q,
               OutSignalName => "Q",
               OutTemp => Q_zd,
               Paths => (
                      0 => ( CLK_dly'LAST_EVENT,
                             tpd_CLK_Q,
                             TRUE)),
               GlitchData => Q_GlitchData,
               Mode  => OnEvent,
               XOn            => XOn,
               MsgOn          => MsgOn,
               MsgSeverity    => WARNING );


END PROCESS;

end behavioral;


LIBRARY IEEE;
USE IEEE.Std_logic_1164.all;
USE IEEE.VITAL_Timing.all;
USE IEEE.VITAL_Primitives.all;
USE work.prim.all;

entity DFFPOSX1 is
   generic (
             tipd_CLK : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             ticd_CLK : VitalDelayType := DefDummyIcd;
             tipd_D : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tisd_D_CLK : VitalDelayType := DefDummyIsd;
             tsetup_D_CLK_posedge_posedge : VitalDelayType := 0.28125 ns;
             tsetup_D_CLK_negedge_posedge : VitalDelayType := 0.28125 ns;
             thold_D_CLK_posedge_posedge : VitalDelayType := -0.0937499 ns;
             thold_D_CLK_negedge_posedge : VitalDelayType := -0.0937499 ns;
             tpw_CLK_posedge : VitalDelayType := 0.166496 ns;
             tpw_CLK_negedge : VitalDelayType := 0.151234 ns;
             tpd_CLK_Q : VitalDelayType01 := (0.155157 ns, 0.252448 ns);

             TimingChecksOn : BOOLEAN := false;
             XOn            : BOOLEAN := DefCombSpikeXOn;
             MsgOn          : BOOLEAN := DefCombSpikeMsgOn;
             instancePath   : STRING  := "*" );

   port (
         CLK : in std_ulogic := 'U' ;
         D : in std_ulogic := 'U' ;
         Q : out std_ulogic);

   attribute VITAL_LEVEL0 of DFFPOSX1 : entity is TRUE;
end DFFPOSX1;

architecture behavioral of DFFPOSX1 is
   attribute VITAL_LEVEL1 of behavioral : architecture is TRUE;

   SIGNAL CLK_dly : std_ulogic := 'X';
   SIGNAL CLK_ipd : std_ulogic := 'X';
   SIGNAL D_dly : std_ulogic := 'X';
   SIGNAL D_ipd : std_ulogic := 'X';

begin

--Input Path Delays
WIREDELAY : BLOCK
BEGIN
   VitalWireDelay( CLK_ipd, CLK, tipd_CLK );
   VitalWireDelay( D_ipd, D, tipd_D );
END BLOCK;

SIGNALDELAY : BLOCK
BEGIN
   VitalSignalDelay( CLK_dly, CLK_ipd, ticd_CLK );
   VitalSignalDelay( D_dly, D_ipd, tisd_D_CLK );
END BLOCK;

VITALBehavior : PROCESS (CLK_dly, D_dly)

      --timing checks section variables
      VARIABLE Tviol_D_CLK : std_ulogic := '0';
      VARIABLE TimeMarker_D_CLK : VitalTimingDataType := VitalTimingDataInit;
      VARIABLE PWviol_CLK : std_ulogic := '0';
      VARIABLE PeriodCheckInfo_CLK : VitalPeriodDataType;

      -- functionality section variables
      VARIABLE intclk : std_ulogic;
      VARIABLE n0_RN_dly : std_ulogic := '0';
      VARIABLE n0_SN_dly : std_ulogic := '0';
      VARIABLE DS0000 : std_ulogic;
      VARIABLE P0002 : std_ulogic;
      VARIABLE n0_vec : std_logic_vector( 1 TO 1 );
      VARIABLE PrevData_udp_dff_n0 : std_logic_vector( 0 TO 4 );
      VARIABLE Q_zd : std_ulogic;
      VARIABLE NOTIFIER : std_ulogic := '0';

      -- path delay section variables
      VARIABLE Q_GlitchData : VitalGlitchDataType;

      BEGIN
          -- Timing checks section
          IF (TimingChecksOn) THEN

                VitalSetupHoldCheck (
                    TestSignal     => D_dly,
                    TestSignalName => "D",
                    RefSignal      => CLK_dly,
                    RefSignalName  => "CLK",
                    SetupHigh      => tsetup_D_CLK_posedge_posedge,
                    SetupLow       => tsetup_D_CLK_negedge_posedge,
                    HoldHigh       => thold_D_CLK_negedge_posedge,
                    HoldLow        => thold_D_CLK_posedge_posedge,
                    CheckEnabled   => TRUE,
                    RefTransition  => 'R',
                    HeaderMsg      => InstancePath & "/DFFPOSX1",
                    TimingData     => TimeMarker_D_CLK,
                    Violation      => Tviol_D_CLK,
                    XOn            => DefSeqXOn,
                    MsgOn          => DefSeqMsgOn,
                    MsgSeverity    => WARNING );

                VitalPeriodPulseCheck (
                    TestSignal     => CLK_dly,
                    TestSignalName => "CLK",
                    Period         => 0 ps,
                    PulseWidthHigh => tpw_CLK_posedge,
                    PulseWidthLow  => tpw_CLK_negedge,
                    PeriodData     => PeriodCheckInfo_CLK,
                    Violation      => PWviol_CLK,
                    HeaderMsg      => InstancePath & "/DFFPOSX1",
                    CheckEnabled   => TRUE,
                    XOn            => DefSeqXOn,
                    MsgOn          => DefSeqMsgOn,
                    MsgSeverity    => WARNING );

          END IF;


          -- Functionality section
          NOTIFIER := (
                        Tviol_D_CLK OR
                        PWviol_CLK );

          intclk := VitalBUF(CLK_dly);

          n0_RN_dly := '0';

          n0_SN_dly := '0';

          VitalStateTable ( StateTable => udp_dff,
                                DataIn => (NOTIFIER, D_dly, intclk, n0_RN_dly, n0_SN_dly),
                             NumStates => 1,
                                Result => n0_vec,
                        PreviousDataIn => PrevData_udp_dff_n0 );

          DS0000 := n0_vec(1);

          P0002 := VitalINV(DS0000);

          Q_zd := VitalBUF(DS0000);


          -- Path delay section
          VitalPathDelay01(
               OutSignal     => Q,
               OutSignalName => "Q",
               OutTemp => Q_zd,
               Paths => (
                      0 => ( CLK_dly'LAST_EVENT,
                             tpd_CLK_Q,
                             TRUE)),
               GlitchData => Q_GlitchData,
               Mode  => OnEvent,
               XOn            => XOn,
               MsgOn          => MsgOn,
               MsgSeverity    => WARNING );


END PROCESS;

end behavioral;


LIBRARY IEEE;
USE IEEE.Std_logic_1164.all;
USE IEEE.VITAL_Timing.all;
USE IEEE.VITAL_Primitives.all;
USE work.prim.all;

entity DFFSR is
   generic (
             tipd_CLK : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             ticd_CLK : VitalDelayType := DefDummyIcd;
             tipd_D : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tisd_D_CLK : VitalDelayType := DefDummyIsd;
             tipd_R : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tisd_R_CLK : VitalDelayType := DefDummyIsd;
             tipd_S : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tisd_S_CLK : VitalDelayType := DefDummyIsd;
             trecovery_R_CLK_posedge_posedge : VitalDelayType := -0.0937499 ns;
             tremoval_R_CLK_posedge_posedge : VitalDelayType := 0.28125 ns;
             trecovery_R_S_posedge_posedge : VitalDelayType := 0.0000000614109 ns;
             trecovery_S_CLK_posedge_posedge : VitalDelayType := 0 ns;
             tremoval_S_CLK_posedge_posedge : VitalDelayType := 0.0937499 ns;
             trecovery_S_R_posedge_posedge : VitalDelayType := 0.0937499 ns;
             tsetup_D_CLK_posedge_posedge : VitalDelayType := 0.1875 ns;
             tsetup_D_CLK_negedge_posedge : VitalDelayType := 0.0937499 ns;
             thold_D_CLK_posedge_posedge : VitalDelayType := 0.0000000614109 ns;
             thold_D_CLK_negedge_posedge : VitalDelayType := 0.0000000591822 ns;
             tpw_S_negedge : VitalDelayType := 0.255376 ns;
             tpw_R_negedge : VitalDelayType := 0.192019 ns;
             tpw_CLK_posedge : VitalDelayType := 0.393155 ns;
             tpw_CLK_negedge : VitalDelayType := 0.288592 ns;
             tremoval_S_R_posedge_posedge : VitalDelayType := VitalZeroDelay;
             tremoval_R_S_posedge_posedge : VitalDelayType := VitalZeroDelay;
             tpd_CLK_Q : VitalDelayType01 := (0.518879 ns, 0.519927 ns);
             tpd_R_Q : VitalDelayType01 := (0.321669 ns, 0.341552 ns);
             tpd_S_Q : VitalDelayType01 := (0.448887 ns, 0 ns);

             TimingChecksOn : BOOLEAN := false;
             XOn            : BOOLEAN := DefCombSpikeXOn;
             MsgOn          : BOOLEAN := DefCombSpikeMsgOn;
             instancePath   : STRING  := "*" );

   port (
         CLK : in std_ulogic := 'U' ;
         D : in std_ulogic := 'U' ;
         R : in std_ulogic := 'U' ;
         S : in std_ulogic := 'U' ;
         Q : out std_ulogic);

   attribute VITAL_LEVEL0 of DFFSR : entity is TRUE;
end DFFSR;

architecture behavioral of DFFSR is
   attribute VITAL_LEVEL1 of behavioral : architecture is TRUE;

   SIGNAL CLK_dly : std_ulogic := 'X';
   SIGNAL CLK_ipd : std_ulogic := 'X';
   SIGNAL D_dly : std_ulogic := 'X';
   SIGNAL D_ipd : std_ulogic := 'X';
   SIGNAL R_dly : std_ulogic := 'X';
   SIGNAL R_ipd : std_ulogic := 'X';
   SIGNAL S_dly : std_ulogic := 'X';
   SIGNAL S_ipd : std_ulogic := 'X';

begin

--Input Path Delays
WIREDELAY : BLOCK
BEGIN
   VitalWireDelay( CLK_ipd, CLK, tipd_CLK );
   VitalWireDelay( D_ipd, D, tipd_D );
   VitalWireDelay( R_ipd, R, tipd_R );
   VitalWireDelay( S_ipd, S, tipd_S );
END BLOCK;

SIGNALDELAY : BLOCK
BEGIN
   VitalSignalDelay( CLK_dly, CLK_ipd, ticd_CLK );
   VitalSignalDelay( D_dly, D_ipd, tisd_D_CLK );
   VitalSignalDelay( R_dly, R_ipd, tisd_R_CLK );
   VitalSignalDelay( S_dly, S_ipd, tisd_S_CLK );
END BLOCK;

VITALBehavior : PROCESS (CLK_dly, D_dly, R_dly, S_dly)

      --timing checks section variables
      VARIABLE Tviol_rec_R_S_posedge : std_ulogic := '0';
      VARIABLE TimeMarker_rec_R_S_posedge : VitalTimingDataType := VitalTimingDataInit;
      VARIABLE Tviol_rec_CLK_S_posedge : std_ulogic := '0';
      VARIABLE TimeMarker_rec_CLK_S_posedge : VitalTimingDataType := VitalTimingDataInit;
      VARIABLE Tviol_rec_S_R_posedge : std_ulogic := '0';
      VARIABLE TimeMarker_rec_S_R_posedge : VitalTimingDataType := VitalTimingDataInit;
      VARIABLE Tviol_rec_CLK_R_posedge : std_ulogic := '0';
      VARIABLE TimeMarker_rec_CLK_R_posedge : VitalTimingDataType := VitalTimingDataInit;
      VARIABLE Tviol_D_CLK : std_ulogic := '0';
      VARIABLE TimeMarker_D_CLK : VitalTimingDataType := VitalTimingDataInit;
      VARIABLE PWviol_S_negedge : std_ulogic := '0';
      VARIABLE PeriodCheckInfo_S_negedge : VitalPeriodDataType;
      VARIABLE PWviol_R_negedge : std_ulogic := '0';
      VARIABLE PeriodCheckInfo_R_negedge : VitalPeriodDataType;
      VARIABLE PWviol_CLK : std_ulogic := '0';
      VARIABLE PeriodCheckInfo_CLK : VitalPeriodDataType;

      -- functionality section variables
      VARIABLE intclk : std_ulogic;
      VARIABLE n0_CLEAR : std_ulogic;
      VARIABLE n0_SET : std_ulogic;
      VARIABLE P0002 : std_ulogic;
      VARIABLE P0003 : std_ulogic;
      VARIABLE D_dly_t : std_ulogic;
      VARIABLE n0_vec : std_logic_vector( 1 TO 1 );
      VARIABLE PrevData_udp_dff_n0 : std_logic_vector( 0 TO 4 );
      VARIABLE Q_zd : std_ulogic;
      VARIABLE n1_cond : std_ulogic;
      VARIABLE n3_var : std_ulogic;
      VARIABLE n2_cond : std_ulogic;
      VARIABLE n4_cond : std_ulogic;
      VARIABLE NOTIFIER : std_ulogic := '0';

      -- path delay section variables
      VARIABLE Q_GlitchData : VitalGlitchDataType;

      BEGIN
          -- Timing checks section
          IF (TimingChecksOn) THEN

                VitalRecoveryRemovalCheck (
                    TestSignal     => S_dly,
                    TestSignalName => "S",
                    RefSignal      => R_dly,
                    RefSignalName  => "R",
                    Recovery       => trecovery_S_R_posedge_posedge,
                    Removal        => tremoval_S_R_posedge_posedge,
                    CheckEnabled   => TRUE,
                    ActiveLow      => TRUE,
                    RefTransition  => 'R',
                    HeaderMsg      => InstancePath & "/DFFSR",
                    TimingData     => TimeMarker_rec_R_S_posedge,
                    Violation      => Tviol_rec_R_S_posedge,
                    XOn            => DefSeqXOn,
                    MsgOn          => DefSeqMsgOn,
                    MsgSeverity    => WARNING );

                VitalRecoveryRemovalCheck (
                    TestSignal     => S_dly,
                    TestSignalName => "S",
                    RefSignal      => CLK_dly,
                    RefSignalName  => "CLK",
                    Recovery       => trecovery_S_CLK_posedge_posedge,
                    Removal        => tremoval_S_CLK_posedge_posedge,
                    CheckEnabled   => To_X01(n2_cond) /= '0',
                    ActiveLow      => TRUE,
                    RefTransition  => 'R',
                    HeaderMsg      => InstancePath & "/DFFSR",
                    TimingData     => TimeMarker_rec_CLK_S_posedge,
                    Violation      => Tviol_rec_CLK_S_posedge,
                    XOn            => DefSeqXOn,
                    MsgOn          => DefSeqMsgOn,
                    MsgSeverity    => WARNING );

                VitalRecoveryRemovalCheck (
                    TestSignal     => R_dly,
                    TestSignalName => "R",
                    RefSignal      => S_dly,
                    RefSignalName  => "S",
                    Recovery       => trecovery_R_S_posedge_posedge,
                    Removal        => tremoval_R_S_posedge_posedge,
                    CheckEnabled   => TRUE,
                    ActiveLow      => TRUE,
                    RefTransition  => 'R',
                    HeaderMsg      => InstancePath & "/DFFSR",
                    TimingData     => TimeMarker_rec_S_R_posedge,
                    Violation      => Tviol_rec_S_R_posedge,
                    XOn            => DefSeqXOn,
                    MsgOn          => DefSeqMsgOn,
                    MsgSeverity    => WARNING );

                VitalRecoveryRemovalCheck (
                    TestSignal     => R_dly,
                    TestSignalName => "R",
                    RefSignal      => CLK_dly,
                    RefSignalName  => "CLK",
                    Recovery       => trecovery_R_CLK_posedge_posedge,
                    Removal        => tremoval_R_CLK_posedge_posedge,
                    CheckEnabled   => To_X01(n1_cond) /= '0',
                    ActiveLow      => TRUE,
                    RefTransition  => 'R',
                    HeaderMsg      => InstancePath & "/DFFSR",
                    TimingData     => TimeMarker_rec_CLK_R_posedge,
                    Violation      => Tviol_rec_CLK_R_posedge,
                    XOn            => DefSeqXOn,
                    MsgOn          => DefSeqMsgOn,
                    MsgSeverity    => WARNING );

                VitalSetupHoldCheck (
                    TestSignal     => D_dly,
                    TestSignalName => "D",
                    RefSignal      => CLK_dly,
                    RefSignalName  => "CLK",
                    SetupHigh      => tsetup_D_CLK_posedge_posedge,
                    SetupLow       => tsetup_D_CLK_negedge_posedge,
                    HoldHigh       => thold_D_CLK_negedge_posedge,
                    HoldLow        => thold_D_CLK_posedge_posedge,
                    CheckEnabled   => To_X01(n4_cond) /= '0',
                    RefTransition  => 'R',
                    HeaderMsg      => InstancePath & "/DFFSR",
                    TimingData     => TimeMarker_D_CLK,
                    Violation      => Tviol_D_CLK,
                    XOn            => DefSeqXOn,
                    MsgOn          => DefSeqMsgOn,
                    MsgSeverity    => WARNING );

                VitalPeriodPulseCheck (
                    TestSignal     => S_dly,
                    TestSignalName => "S",
                    Period         => 0 ps,
                    PulseWidthHigh => 0 ns,
                    PulseWidthLow  => tpw_S_negedge,
                    PeriodData     => PeriodCheckInfo_S_negedge,
                    Violation      => PWviol_S_negedge,
                    HeaderMsg      => InstancePath & "/DFFSR",
                    CheckEnabled   => TRUE,
                    XOn            => DefSeqXOn,
                    MsgOn          => DefSeqMsgOn,
                    MsgSeverity    => WARNING );

                VitalPeriodPulseCheck (
                    TestSignal     => R_dly,
                    TestSignalName => "R",
                    Period         => 0 ps,
                    PulseWidthHigh => 0 ns,
                    PulseWidthLow  => tpw_R_negedge,
                    PeriodData     => PeriodCheckInfo_R_negedge,
                    Violation      => PWviol_R_negedge,
                    HeaderMsg      => InstancePath & "/DFFSR",
                    CheckEnabled   => TRUE,
                    XOn            => DefSeqXOn,
                    MsgOn          => DefSeqMsgOn,
                    MsgSeverity    => WARNING );

                VitalPeriodPulseCheck (
                    TestSignal     => CLK_dly,
                    TestSignalName => "CLK",
                    Period         => 0 ps,
                    PulseWidthHigh => tpw_CLK_posedge,
                    PulseWidthLow  => tpw_CLK_negedge,
                    PeriodData     => PeriodCheckInfo_CLK,
                    Violation      => PWviol_CLK,
                    HeaderMsg      => InstancePath & "/DFFSR",
                    CheckEnabled   => TRUE,
                    XOn            => DefSeqXOn,
                    MsgOn          => DefSeqMsgOn,
                    MsgSeverity    => WARNING );

          END IF;


          -- Functionality section
          NOTIFIER := (
                        Tviol_rec_R_S_posedge OR
                        Tviol_rec_CLK_S_posedge OR
                        Tviol_rec_S_R_posedge OR
                        Tviol_rec_CLK_R_posedge OR
                        Tviol_D_CLK OR
                        PWviol_S_negedge OR
                        PWviol_R_negedge OR
                        PWviol_CLK );

          intclk := VitalBUF(CLK_dly);

          n0_CLEAR := VitalINV(R_dly);

          n0_SET := VitalINV(S_dly);

          D_dly_t := VitalINV(D_dly);

          VitalStateTable ( StateTable => udp_dff,
                                DataIn => (NOTIFIER, D_dly_t, intclk, n0_SET, n0_CLEAR),
                             NumStates => 1,
                                Result => n0_vec,
                        PreviousDataIn => PrevData_udp_dff_n0 );

          P0003 := n0_vec(1);

          P0002 := VitalINV(P0003);

          Q_zd := VitalBUF(P0002);

          n1_cond := VitalAND2(D_dly, S_dly);

          n3_var := VitalINV(D_dly);
          n2_cond := VitalAND2(n3_var, R_dly);

          n4_cond := VitalAND2(S_dly, R_dly);


          -- Path delay section
          VitalPathDelay01(
               OutSignal     => Q,
               OutSignalName => "Q",
               OutTemp => Q_zd,
               Paths => (
                      0 => ( CLK_dly'LAST_EVENT,
                             tpd_CLK_Q,
                             TRUE),
                      1 => ( R_dly'LAST_EVENT,
                             tpd_R_Q,
                             TRUE),
                      2 => ( S_dly'LAST_EVENT,
                             tpd_S_Q,
                             TRUE)),
               GlitchData => Q_GlitchData,
               Mode  => OnEvent,
               XOn            => XOn,
               MsgOn          => MsgOn,
               MsgSeverity    => WARNING );


END PROCESS;

end behavioral;


LIBRARY IEEE;
USE IEEE.Std_logic_1164.all;
USE IEEE.VITAL_Timing.all;
USE IEEE.VITAL_Primitives.all;
USE work.prim.all;

entity FAX1 is
   generic (
             tipd_A : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tipd_B : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tipd_C : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tpd_A_YC : VitalDelayType01 := (0.192937 ns, 0.212316 ns);
             tpd_A_YS : VitalDelayType01 := (0.311797 ns, 0.299535 ns);
             tpd_B_YC : VitalDelayType01 := (0.201655 ns, 0.221213 ns);
             tpd_B_YS : VitalDelayType01 := (0.326354 ns, 0.311475 ns);
             tpd_C_YC : VitalDelayType01 := (0.185775 ns, 0.203317 ns);
             tpd_C_YS : VitalDelayType01 := (0.322002 ns, 0.296791 ns);

             XOn            : BOOLEAN := DefCombSpikeXOn;
             MsgOn          : BOOLEAN := DefCombSpikeMsgOn;
             instancePath   : STRING  := "*" );

   port (
         A : in std_ulogic := 'U' ;
         B : in std_ulogic := 'U' ;
         C : in std_ulogic := 'U' ;
         YC : out std_ulogic ;
         YS : out std_ulogic);

   attribute VITAL_LEVEL0 of FAX1 : entity is TRUE;
end FAX1;

architecture behavioral of FAX1 is
   attribute VITAL_LEVEL1 of behavioral : architecture is TRUE;

   SIGNAL A_ipd : std_ulogic := 'X';
   SIGNAL B_ipd : std_ulogic := 'X';
   SIGNAL C_ipd : std_ulogic := 'X';

begin

--Input Path Delays
WIREDELAY : BLOCK
BEGIN
   VitalWireDelay( A_ipd, A, tipd_A );
   VitalWireDelay( B_ipd, B, tipd_B );
   VitalWireDelay( C_ipd, C, tipd_C );
END BLOCK;

VITALBehavior : PROCESS (A_ipd, B_ipd, C_ipd)


      -- functionality section variables
      VARIABLE n0_var : std_ulogic;
      VARIABLE n1_var : std_ulogic;
      VARIABLE n2_var : std_ulogic;
      VARIABLE n3_var : std_ulogic;
      VARIABLE YC_zd : std_ulogic;
      VARIABLE n4_var : std_ulogic;
      VARIABLE YS_zd : std_ulogic;

      -- path delay section variables
      VARIABLE YC_GlitchData : VitalGlitchDataType;
      VARIABLE YS_GlitchData : VitalGlitchDataType;

      BEGIN
          -- Functionality section
          n0_var := VitalAND2(A_ipd, B_ipd);
          n1_var := VitalAND2(B_ipd, C_ipd);
          n2_var := VitalOR2(n0_var, n1_var);
          n3_var := VitalAND2(C_ipd, A_ipd);
          YC_zd := VitalOR2(n2_var, n3_var);

          n4_var := VitalXOR2(A_ipd, B_ipd);
          YS_zd := VitalXOR2(n4_var, C_ipd);


          -- Path delay section
          VitalPathDelay01(
               OutSignal     => YC,
               OutSignalName => "YC",
               OutTemp => YC_zd,
               Paths => (
                      0 => ( A_ipd'LAST_EVENT,
                             tpd_A_YC,
                             TRUE),
                      1 => ( B_ipd'LAST_EVENT,
                             tpd_B_YC,
                             TRUE),
                      2 => ( C_ipd'LAST_EVENT,
                             tpd_C_YC,
                             TRUE)),
               GlitchData => YC_GlitchData,
               Mode  => OnEvent,
               XOn            => XOn,
               MsgOn          => MsgOn,
               MsgSeverity    => WARNING );

          VitalPathDelay01(
               OutSignal     => YS,
               OutSignalName => "YS",
               OutTemp => YS_zd,
               Paths => (
                      0 => ( A_ipd'LAST_EVENT,
                             tpd_A_YS,
                             TRUE),
                      1 => ( B_ipd'LAST_EVENT,
                             tpd_B_YS,
                             TRUE),
                      2 => ( C_ipd'LAST_EVENT,
                             tpd_C_YS,
                             TRUE)),
               GlitchData => YS_GlitchData,
               Mode  => OnEvent,
               XOn            => XOn,
               MsgOn          => MsgOn,
               MsgSeverity    => WARNING );


END PROCESS;

end behavioral;


LIBRARY IEEE;
USE IEEE.Std_logic_1164.all;
USE IEEE.VITAL_Timing.all;
USE IEEE.VITAL_Primitives.all;
USE work.prim.all;

entity HAX1 is
   generic (
             tipd_A : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tipd_B : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tpd_A_YC : VitalDelayType01 := (0.140081 ns, 0.177776 ns);
             tpd_A_YS : VitalDelayType01 := (0.226483 ns, 0.245071 ns);
             tpd_B_YC : VitalDelayType01 := (0.139715 ns, 0.160211 ns);
             tpd_B_YS : VitalDelayType01 := (0.223106 ns, 0.245491 ns);

             XOn            : BOOLEAN := DefCombSpikeXOn;
             MsgOn          : BOOLEAN := DefCombSpikeMsgOn;
             instancePath   : STRING  := "*" );

   port (
         A : in std_ulogic := 'U' ;
         B : in std_ulogic := 'U' ;
         YC : out std_ulogic ;
         YS : out std_ulogic);

   attribute VITAL_LEVEL0 of HAX1 : entity is TRUE;
end HAX1;

architecture behavioral of HAX1 is
   attribute VITAL_LEVEL1 of behavioral : architecture is TRUE;

   SIGNAL A_ipd : std_ulogic := 'X';
   SIGNAL B_ipd : std_ulogic := 'X';

begin

--Input Path Delays
WIREDELAY : BLOCK
BEGIN
   VitalWireDelay( A_ipd, A, tipd_A );
   VitalWireDelay( B_ipd, B, tipd_B );
END BLOCK;

VITALBehavior : PROCESS (A_ipd, B_ipd)


      -- functionality section variables
      VARIABLE YC_zd : std_ulogic;
      VARIABLE YS_zd : std_ulogic;

      -- path delay section variables
      VARIABLE YC_GlitchData : VitalGlitchDataType;
      VARIABLE YS_GlitchData : VitalGlitchDataType;

      BEGIN
          -- Functionality section
          YC_zd := VitalAND2(A_ipd, B_ipd);

          YS_zd := VitalXOR2(A_ipd, B_ipd);


          -- Path delay section
          VitalPathDelay01(
               OutSignal     => YC,
               OutSignalName => "YC",
               OutTemp => YC_zd,
               Paths => (
                      0 => ( A_ipd'LAST_EVENT,
                             tpd_A_YC,
                             TRUE),
                      1 => ( B_ipd'LAST_EVENT,
                             tpd_B_YC,
                             TRUE)),
               GlitchData => YC_GlitchData,
               Mode  => OnEvent,
               XOn            => XOn,
               MsgOn          => MsgOn,
               MsgSeverity    => WARNING );

          VitalPathDelay01(
               OutSignal     => YS,
               OutSignalName => "YS",
               OutTemp => YS_zd,
               Paths => (
                      0 => ( A_ipd'LAST_EVENT,
                             tpd_A_YS,
                             TRUE),
                      1 => ( B_ipd'LAST_EVENT,
                             tpd_B_YS,
                             TRUE)),
               GlitchData => YS_GlitchData,
               Mode  => OnEvent,
               XOn            => XOn,
               MsgOn          => MsgOn,
               MsgSeverity    => WARNING );


END PROCESS;

end behavioral;


LIBRARY IEEE;
USE IEEE.Std_logic_1164.all;
USE IEEE.VITAL_Timing.all;
USE IEEE.VITAL_Primitives.all;
USE work.prim.all;

entity INVX1 is
   generic (
             tipd_A : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tpd_A_Y : VitalDelayType01 := (0.0581489 ns, 0.052639 ns);

             XOn            : BOOLEAN := DefCombSpikeXOn;
             MsgOn          : BOOLEAN := DefCombSpikeMsgOn;
             instancePath   : STRING  := "*" );

   port (
         A : in std_ulogic := 'U' ;
         Y : out std_ulogic);

   attribute VITAL_LEVEL0 of INVX1 : entity is TRUE;
end INVX1;

architecture behavioral of INVX1 is
   attribute VITAL_LEVEL1 of behavioral : architecture is TRUE;

   SIGNAL A_ipd : std_ulogic := 'X';

begin

--Input Path Delays
WIREDELAY : BLOCK
BEGIN
   VitalWireDelay( A_ipd, A, tipd_A );
END BLOCK;

VITALBehavior : PROCESS (A_ipd)


      -- functionality section variables
      VARIABLE Y_zd : std_ulogic;

      -- path delay section variables
      VARIABLE Y_GlitchData : VitalGlitchDataType;

      BEGIN
          -- Functionality section
          Y_zd := VitalINV(A_ipd);


          -- Path delay section
          VitalPathDelay01(
               OutSignal     => Y,
               OutSignalName => "Y",
               OutTemp => Y_zd,
               Paths => (
                      0 => ( A_ipd'LAST_EVENT,
                             tpd_A_Y,
                             TRUE)),
               GlitchData => Y_GlitchData,
               Mode  => OnEvent,
               XOn            => XOn,
               MsgOn          => MsgOn,
               MsgSeverity    => WARNING );


END PROCESS;

end behavioral;


LIBRARY IEEE;
USE IEEE.Std_logic_1164.all;
USE IEEE.VITAL_Timing.all;
USE IEEE.VITAL_Primitives.all;
USE work.prim.all;

entity INVX2 is
   generic (
             tipd_A : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tpd_A_Y : VitalDelayType01 := (0.0575634 ns, 0.0532733 ns);

             XOn            : BOOLEAN := DefCombSpikeXOn;
             MsgOn          : BOOLEAN := DefCombSpikeMsgOn;
             instancePath   : STRING  := "*" );

   port (
         A : in std_ulogic := 'U' ;
         Y : out std_ulogic);

   attribute VITAL_LEVEL0 of INVX2 : entity is TRUE;
end INVX2;

architecture behavioral of INVX2 is
   attribute VITAL_LEVEL1 of behavioral : architecture is TRUE;

   SIGNAL A_ipd : std_ulogic := 'X';

begin

--Input Path Delays
WIREDELAY : BLOCK
BEGIN
   VitalWireDelay( A_ipd, A, tipd_A );
END BLOCK;

VITALBehavior : PROCESS (A_ipd)


      -- functionality section variables
      VARIABLE Y_zd : std_ulogic;

      -- path delay section variables
      VARIABLE Y_GlitchData : VitalGlitchDataType;

      BEGIN
          -- Functionality section
          Y_zd := VitalINV(A_ipd);


          -- Path delay section
          VitalPathDelay01(
               OutSignal     => Y,
               OutSignalName => "Y",
               OutTemp => Y_zd,
               Paths => (
                      0 => ( A_ipd'LAST_EVENT,
                             tpd_A_Y,
                             TRUE)),
               GlitchData => Y_GlitchData,
               Mode  => OnEvent,
               XOn            => XOn,
               MsgOn          => MsgOn,
               MsgSeverity    => WARNING );


END PROCESS;

end behavioral;


LIBRARY IEEE;
USE IEEE.Std_logic_1164.all;
USE IEEE.VITAL_Timing.all;
USE IEEE.VITAL_Primitives.all;
USE work.prim.all;

entity INVX4 is
   generic (
             tipd_A : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tpd_A_Y : VitalDelayType01 := (0.0575634 ns, 0.0532733 ns);

             XOn            : BOOLEAN := DefCombSpikeXOn;
             MsgOn          : BOOLEAN := DefCombSpikeMsgOn;
             instancePath   : STRING  := "*" );

   port (
         A : in std_ulogic := 'U' ;
         Y : out std_ulogic);

   attribute VITAL_LEVEL0 of INVX4 : entity is TRUE;
end INVX4;

architecture behavioral of INVX4 is
   attribute VITAL_LEVEL1 of behavioral : architecture is TRUE;

   SIGNAL A_ipd : std_ulogic := 'X';

begin

--Input Path Delays
WIREDELAY : BLOCK
BEGIN
   VitalWireDelay( A_ipd, A, tipd_A );
END BLOCK;

VITALBehavior : PROCESS (A_ipd)


      -- functionality section variables
      VARIABLE Y_zd : std_ulogic;

      -- path delay section variables
      VARIABLE Y_GlitchData : VitalGlitchDataType;

      BEGIN
          -- Functionality section
          Y_zd := VitalINV(A_ipd);


          -- Path delay section
          VitalPathDelay01(
               OutSignal     => Y,
               OutSignalName => "Y",
               OutTemp => Y_zd,
               Paths => (
                      0 => ( A_ipd'LAST_EVENT,
                             tpd_A_Y,
                             TRUE)),
               GlitchData => Y_GlitchData,
               Mode  => OnEvent,
               XOn            => XOn,
               MsgOn          => MsgOn,
               MsgSeverity    => WARNING );


END PROCESS;

end behavioral;


LIBRARY IEEE;
USE IEEE.Std_logic_1164.all;
USE IEEE.VITAL_Timing.all;
USE IEEE.VITAL_Primitives.all;
USE work.prim.all;

entity INVX8 is
   generic (
             tipd_A : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tpd_A_Y : VitalDelayType01 := (0.0575634 ns, 0.0532733 ns);

             XOn            : BOOLEAN := DefCombSpikeXOn;
             MsgOn          : BOOLEAN := DefCombSpikeMsgOn;
             instancePath   : STRING  := "*" );

   port (
         A : in std_ulogic := 'U' ;
         Y : out std_ulogic);

   attribute VITAL_LEVEL0 of INVX8 : entity is TRUE;
end INVX8;

architecture behavioral of INVX8 is
   attribute VITAL_LEVEL1 of behavioral : architecture is TRUE;

   SIGNAL A_ipd : std_ulogic := 'X';

begin

--Input Path Delays
WIREDELAY : BLOCK
BEGIN
   VitalWireDelay( A_ipd, A, tipd_A );
END BLOCK;

VITALBehavior : PROCESS (A_ipd)


      -- functionality section variables
      VARIABLE Y_zd : std_ulogic;

      -- path delay section variables
      VARIABLE Y_GlitchData : VitalGlitchDataType;

      BEGIN
          -- Functionality section
          Y_zd := VitalINV(A_ipd);


          -- Path delay section
          VitalPathDelay01(
               OutSignal     => Y,
               OutSignalName => "Y",
               OutTemp => Y_zd,
               Paths => (
                      0 => ( A_ipd'LAST_EVENT,
                             tpd_A_Y,
                             TRUE)),
               GlitchData => Y_GlitchData,
               Mode  => OnEvent,
               XOn            => XOn,
               MsgOn          => MsgOn,
               MsgSeverity    => WARNING );


END PROCESS;

end behavioral;


LIBRARY IEEE;
USE IEEE.Std_logic_1164.all;
USE IEEE.VITAL_Timing.all;
USE IEEE.VITAL_Primitives.all;
USE work.prim.all;

entity LATCH is
   generic (
             tipd_CLK : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             ticd_CLK : VitalDelayType := DefDummyIcd;
             tipd_D : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tisd_D_CLK : VitalDelayType := DefDummyIsd;
             tsetup_D_CLK_posedge_negedge : VitalDelayType := 0.28125 ns;
             tsetup_D_CLK_negedge_negedge : VitalDelayType := 0.28125 ns;
             thold_D_CLK_posedge_negedge : VitalDelayType := -0.0937499 ns;
             thold_D_CLK_negedge_negedge : VitalDelayType := -0.0937499 ns;
             tpw_CLK_posedge : VitalDelayType := 0.211198 ns;
             tpd_CLK_Q : VitalDelayType01 := (0.25464 ns, 0.34292 ns);
             tpd_D_Q : VitalDelayType01 := (0.300641 ns, 0.339721 ns);

             TimingChecksOn : BOOLEAN := false;
             XOn            : BOOLEAN := DefCombSpikeXOn;
             MsgOn          : BOOLEAN := DefCombSpikeMsgOn;
             instancePath   : STRING  := "*" );

   port (
         CLK : in std_ulogic := 'U' ;
         D : in std_ulogic := 'U' ;
         Q : out std_ulogic);

   attribute VITAL_LEVEL0 of LATCH : entity is TRUE;
end LATCH;

architecture behavioral of LATCH is
   attribute VITAL_LEVEL1 of behavioral : architecture is TRUE;

   SIGNAL CLK_dly : std_ulogic := 'X';
   SIGNAL CLK_ipd : std_ulogic := 'X';
   SIGNAL D_dly : std_ulogic := 'X';
   SIGNAL D_ipd : std_ulogic := 'X';

begin

--Input Path Delays
WIREDELAY : BLOCK
BEGIN
   VitalWireDelay( CLK_ipd, CLK, tipd_CLK );
   VitalWireDelay( D_ipd, D, tipd_D );
END BLOCK;

SIGNALDELAY : BLOCK
BEGIN
   VitalSignalDelay( CLK_dly, CLK_ipd, ticd_CLK );
   VitalSignalDelay( D_dly, D_ipd, tisd_D_CLK );
END BLOCK;

VITALBehavior : PROCESS (CLK_dly, D_dly)

      --timing checks section variables
      VARIABLE Tviol_D_CLK : std_ulogic := '0';
      VARIABLE TimeMarker_D_CLK : VitalTimingDataType := VitalTimingDataInit;
      VARIABLE PWviol_CLK_posedge : std_ulogic := '0';
      VARIABLE PeriodCheckInfo_CLK_posedge : VitalPeriodDataType;

      -- functionality section variables
      VARIABLE n0_RN_dly : std_ulogic := '0';
      VARIABLE n0_SN_dly : std_ulogic := '0';
      VARIABLE DS0000 : std_ulogic;
      VARIABLE P0000 : std_ulogic;
      VARIABLE n0_vec : std_logic_vector( 1 TO 1 );
      VARIABLE PrevData_udp_tlat_n0 : std_logic_vector( 0 TO 4 );
      VARIABLE Q_zd : std_ulogic;
      VARIABLE NOTIFIER : std_ulogic := '0';

      -- path delay section variables
      VARIABLE Q_GlitchData : VitalGlitchDataType;

      BEGIN
          -- Timing checks section
          IF (TimingChecksOn) THEN

                VitalSetupHoldCheck (
                    TestSignal     => D_dly,
                    TestSignalName => "D",
                    RefSignal      => CLK_dly,
                    RefSignalName  => "CLK",
                    SetupHigh      => tsetup_D_CLK_posedge_negedge,
                    SetupLow       => tsetup_D_CLK_negedge_negedge,
                    HoldHigh       => thold_D_CLK_negedge_negedge,
                    HoldLow        => thold_D_CLK_posedge_negedge,
                    CheckEnabled   => TRUE,
                    RefTransition  => 'F',
                    HeaderMsg      => InstancePath & "/LATCH",
                    TimingData     => TimeMarker_D_CLK,
                    Violation      => Tviol_D_CLK,
                    XOn            => DefSeqXOn,
                    MsgOn          => DefSeqMsgOn,
                    MsgSeverity    => WARNING );

                VitalPeriodPulseCheck (
                    TestSignal     => CLK_dly,
                    TestSignalName => "CLK",
                    Period         => 0 ps,
                    PulseWidthHigh => tpw_CLK_posedge,
                    PulseWidthLow  => 0 ns,
                    PeriodData     => PeriodCheckInfo_CLK_posedge,
                    Violation      => PWviol_CLK_posedge,
                    HeaderMsg      => InstancePath & "/LATCH",
                    CheckEnabled   => TRUE,
                    XOn            => DefSeqXOn,
                    MsgOn          => DefSeqMsgOn,
                    MsgSeverity    => WARNING );

          END IF;


          -- Functionality section
          NOTIFIER := (
                        Tviol_D_CLK OR
                        PWviol_CLK_posedge );

          n0_RN_dly := '0';

          n0_SN_dly := '0';

          VitalStateTable ( StateTable => udp_tlat,
                                DataIn => (NOTIFIER, D_dly, CLK_dly, n0_RN_dly, n0_SN_dly),
                             NumStates => 1,
                                Result => n0_vec,
                        PreviousDataIn => PrevData_udp_tlat_n0 );

          DS0000 := n0_vec(1);

          P0000 := VitalINV(DS0000);

          Q_zd := VitalBUF(DS0000);


          -- Path delay section
          VitalPathDelay01(
               OutSignal     => Q,
               OutSignalName => "Q",
               OutTemp => Q_zd,
               Paths => (
                      0 => ( CLK_dly'LAST_EVENT,
                             tpd_CLK_Q,
                             TRUE),
                      1 => ( D_dly'LAST_EVENT,
                             tpd_D_Q,
                             TRUE)),
               GlitchData => Q_GlitchData,
               Mode  => OnEvent,
               XOn            => XOn,
               MsgOn          => MsgOn,
               MsgSeverity    => WARNING );


END PROCESS;

end behavioral;


LIBRARY IEEE;
USE IEEE.Std_logic_1164.all;
USE IEEE.VITAL_Timing.all;
USE IEEE.VITAL_Primitives.all;
USE work.prim.all;

entity MUX2X1 is
   generic (
             tipd_A : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tipd_B : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tipd_S : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tpd_A_Y : VitalDelayType01 := (0.106454 ns, 0.082336 ns);
             tpd_B_Y : VitalDelayType01 := (0.0962971 ns, 0.0938023 ns);
             tpd_S_Y : VitalDelayType01 := (0.152242 ns, 0.159088 ns);

             XOn            : BOOLEAN := DefCombSpikeXOn;
             MsgOn          : BOOLEAN := DefCombSpikeMsgOn;
             instancePath   : STRING  := "*" );

   port (
         A : in std_ulogic := 'U' ;
         B : in std_ulogic := 'U' ;
         S : in std_ulogic := 'U' ;
         Y : out std_ulogic);

   attribute VITAL_LEVEL0 of MUX2X1 : entity is TRUE;
end MUX2X1;

architecture behavioral of MUX2X1 is
   attribute VITAL_LEVEL1 of behavioral : architecture is TRUE;

   SIGNAL A_ipd : std_ulogic := 'X';
   SIGNAL B_ipd : std_ulogic := 'X';
   SIGNAL S_ipd : std_ulogic := 'X';

begin

--Input Path Delays
WIREDELAY : BLOCK
BEGIN
   VitalWireDelay( A_ipd, A, tipd_A );
   VitalWireDelay( B_ipd, B, tipd_B );
   VitalWireDelay( S_ipd, S, tipd_S );
END BLOCK;

VITALBehavior : PROCESS (A_ipd, B_ipd, S_ipd)


      -- functionality section variables
      VARIABLE n0_var : std_ulogic;
      VARIABLE Y_zd : std_ulogic;

      -- path delay section variables
      VARIABLE Y_GlitchData : VitalGlitchDataType;

      BEGIN
          -- Functionality section
          n0_var := VitalMUX2(A_ipd, B_ipd, S_ipd);
          Y_zd := VitalINV(n0_var);


          -- Path delay section
          VitalPathDelay01(
               OutSignal     => Y,
               OutSignalName => "Y",
               OutTemp => Y_zd,
               Paths => (
                      0 => ( A_ipd'LAST_EVENT,
                             tpd_A_Y,
                             TRUE),
                      1 => ( B_ipd'LAST_EVENT,
                             tpd_B_Y,
                             TRUE),
                      2 => ( S_ipd'LAST_EVENT,
                             tpd_S_Y,
                             TRUE)),
               GlitchData => Y_GlitchData,
               Mode  => OnEvent,
               XOn            => XOn,
               MsgOn          => MsgOn,
               MsgSeverity    => WARNING );


END PROCESS;

end behavioral;


LIBRARY IEEE;
USE IEEE.Std_logic_1164.all;
USE IEEE.VITAL_Timing.all;
USE IEEE.VITAL_Primitives.all;
USE work.prim.all;

entity NAND2X1 is
   generic (
             tipd_A : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tipd_B : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tpd_A_Y : VitalDelayType01 := (0.0841201 ns, 0.0506177 ns);
             tpd_B_Y : VitalDelayType01 := (0.0686001 ns, 0.0509942 ns);

             XOn            : BOOLEAN := DefCombSpikeXOn;
             MsgOn          : BOOLEAN := DefCombSpikeMsgOn;
             instancePath   : STRING  := "*" );

   port (
         A : in std_ulogic := 'U' ;
         B : in std_ulogic := 'U' ;
         Y : out std_ulogic);

   attribute VITAL_LEVEL0 of NAND2X1 : entity is TRUE;
end NAND2X1;

architecture behavioral of NAND2X1 is
   attribute VITAL_LEVEL1 of behavioral : architecture is TRUE;

   SIGNAL A_ipd : std_ulogic := 'X';
   SIGNAL B_ipd : std_ulogic := 'X';

begin

--Input Path Delays
WIREDELAY : BLOCK
BEGIN
   VitalWireDelay( A_ipd, A, tipd_A );
   VitalWireDelay( B_ipd, B, tipd_B );
END BLOCK;

VITALBehavior : PROCESS (A_ipd, B_ipd)


      -- functionality section variables
      VARIABLE n0_var : std_ulogic;
      VARIABLE Y_zd : std_ulogic;

      -- path delay section variables
      VARIABLE Y_GlitchData : VitalGlitchDataType;

      BEGIN
          -- Functionality section
          n0_var := VitalAND2(A_ipd, B_ipd);
          Y_zd := VitalINV(n0_var);


          -- Path delay section
          VitalPathDelay01(
               OutSignal     => Y,
               OutSignalName => "Y",
               OutTemp => Y_zd,
               Paths => (
                      0 => ( A_ipd'LAST_EVENT,
                             tpd_A_Y,
                             TRUE),
                      1 => ( B_ipd'LAST_EVENT,
                             tpd_B_Y,
                             TRUE)),
               GlitchData => Y_GlitchData,
               Mode  => OnEvent,
               XOn            => XOn,
               MsgOn          => MsgOn,
               MsgSeverity    => WARNING );


END PROCESS;

end behavioral;


LIBRARY IEEE;
USE IEEE.Std_logic_1164.all;
USE IEEE.VITAL_Timing.all;
USE IEEE.VITAL_Primitives.all;
USE work.prim.all;

entity NAND3X1 is
   generic (
             tipd_A : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tipd_B : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tipd_C : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tpd_A_Y : VitalDelayType01 := (0.124147 ns, 0.0630651 ns);
             tpd_B_Y : VitalDelayType01 := (0.103758 ns, 0.0601785 ns);
             tpd_C_Y : VitalDelayType01 := (0.0764628 ns, 0.0525741 ns);

             XOn            : BOOLEAN := DefCombSpikeXOn;
             MsgOn          : BOOLEAN := DefCombSpikeMsgOn;
             instancePath   : STRING  := "*" );

   port (
         A : in std_ulogic := 'U' ;
         B : in std_ulogic := 'U' ;
         C : in std_ulogic := 'U' ;
         Y : out std_ulogic);

   attribute VITAL_LEVEL0 of NAND3X1 : entity is TRUE;
end NAND3X1;

architecture behavioral of NAND3X1 is
   attribute VITAL_LEVEL1 of behavioral : architecture is TRUE;

   SIGNAL A_ipd : std_ulogic := 'X';
   SIGNAL B_ipd : std_ulogic := 'X';
   SIGNAL C_ipd : std_ulogic := 'X';

begin

--Input Path Delays
WIREDELAY : BLOCK
BEGIN
   VitalWireDelay( A_ipd, A, tipd_A );
   VitalWireDelay( B_ipd, B, tipd_B );
   VitalWireDelay( C_ipd, C, tipd_C );
END BLOCK;

VITALBehavior : PROCESS (A_ipd, B_ipd, C_ipd)


      -- functionality section variables
      VARIABLE n0_var : std_ulogic;
      VARIABLE n1_var : std_ulogic;
      VARIABLE Y_zd : std_ulogic;

      -- path delay section variables
      VARIABLE Y_GlitchData : VitalGlitchDataType;

      BEGIN
          -- Functionality section
          n0_var := VitalAND2(A_ipd, B_ipd);
          n1_var := VitalAND2(n0_var, C_ipd);
          Y_zd := VitalINV(n1_var);


          -- Path delay section
          VitalPathDelay01(
               OutSignal     => Y,
               OutSignalName => "Y",
               OutTemp => Y_zd,
               Paths => (
                      0 => ( A_ipd'LAST_EVENT,
                             tpd_A_Y,
                             TRUE),
                      1 => ( B_ipd'LAST_EVENT,
                             tpd_B_Y,
                             TRUE),
                      2 => ( C_ipd'LAST_EVENT,
                             tpd_C_Y,
                             TRUE)),
               GlitchData => Y_GlitchData,
               Mode  => OnEvent,
               XOn            => XOn,
               MsgOn          => MsgOn,
               MsgSeverity    => WARNING );


END PROCESS;

end behavioral;


LIBRARY IEEE;
USE IEEE.Std_logic_1164.all;
USE IEEE.VITAL_Timing.all;
USE IEEE.VITAL_Primitives.all;
USE work.prim.all;

entity NOR2X1 is
   generic (
             tipd_A : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tipd_B : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tpd_A_Y : VitalDelayType01 := (0.0746605 ns, 0.0942225 ns);
             tpd_B_Y : VitalDelayType01 := (0.0625703 ns, 0.0696981 ns);

             XOn            : BOOLEAN := DefCombSpikeXOn;
             MsgOn          : BOOLEAN := DefCombSpikeMsgOn;
             instancePath   : STRING  := "*" );

   port (
         A : in std_ulogic := 'U' ;
         B : in std_ulogic := 'U' ;
         Y : out std_ulogic);

   attribute VITAL_LEVEL0 of NOR2X1 : entity is TRUE;
end NOR2X1;

architecture behavioral of NOR2X1 is
   attribute VITAL_LEVEL1 of behavioral : architecture is TRUE;

   SIGNAL A_ipd : std_ulogic := 'X';
   SIGNAL B_ipd : std_ulogic := 'X';

begin

--Input Path Delays
WIREDELAY : BLOCK
BEGIN
   VitalWireDelay( A_ipd, A, tipd_A );
   VitalWireDelay( B_ipd, B, tipd_B );
END BLOCK;

VITALBehavior : PROCESS (A_ipd, B_ipd)


      -- functionality section variables
      VARIABLE n0_var : std_ulogic;
      VARIABLE Y_zd : std_ulogic;

      -- path delay section variables
      VARIABLE Y_GlitchData : VitalGlitchDataType;

      BEGIN
          -- Functionality section
          n0_var := VitalOR2(A_ipd, B_ipd);
          Y_zd := VitalINV(n0_var);


          -- Path delay section
          VitalPathDelay01(
               OutSignal     => Y,
               OutSignalName => "Y",
               OutTemp => Y_zd,
               Paths => (
                      0 => ( A_ipd'LAST_EVENT,
                             tpd_A_Y,
                             TRUE),
                      1 => ( B_ipd'LAST_EVENT,
                             tpd_B_Y,
                             TRUE)),
               GlitchData => Y_GlitchData,
               Mode  => OnEvent,
               XOn            => XOn,
               MsgOn          => MsgOn,
               MsgSeverity    => WARNING );


END PROCESS;

end behavioral;


LIBRARY IEEE;
USE IEEE.Std_logic_1164.all;
USE IEEE.VITAL_Timing.all;
USE IEEE.VITAL_Primitives.all;
USE work.prim.all;

entity NOR3X1 is
   generic (
             tipd_A : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tipd_B : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tipd_C : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tpd_A_Y : VitalDelayType01 := (0.111162 ns, 0.152754 ns);
             tpd_B_Y : VitalDelayType01 := (0.0991344 ns, 0.128504 ns);
             tpd_C_Y : VitalDelayType01 := (0.0639502 ns, 0.0830099 ns);

             XOn            : BOOLEAN := DefCombSpikeXOn;
             MsgOn          : BOOLEAN := DefCombSpikeMsgOn;
             instancePath   : STRING  := "*" );

   port (
         A : in std_ulogic := 'U' ;
         B : in std_ulogic := 'U' ;
         C : in std_ulogic := 'U' ;
         Y : out std_ulogic);

   attribute VITAL_LEVEL0 of NOR3X1 : entity is TRUE;
end NOR3X1;

architecture behavioral of NOR3X1 is
   attribute VITAL_LEVEL1 of behavioral : architecture is TRUE;

   SIGNAL A_ipd : std_ulogic := 'X';
   SIGNAL B_ipd : std_ulogic := 'X';
   SIGNAL C_ipd : std_ulogic := 'X';

begin

--Input Path Delays
WIREDELAY : BLOCK
BEGIN
   VitalWireDelay( A_ipd, A, tipd_A );
   VitalWireDelay( B_ipd, B, tipd_B );
   VitalWireDelay( C_ipd, C, tipd_C );
END BLOCK;

VITALBehavior : PROCESS (A_ipd, B_ipd, C_ipd)


      -- functionality section variables
      VARIABLE n0_var : std_ulogic;
      VARIABLE n1_var : std_ulogic;
      VARIABLE Y_zd : std_ulogic;

      -- path delay section variables
      VARIABLE Y_GlitchData : VitalGlitchDataType;

      BEGIN
          -- Functionality section
          n0_var := VitalOR2(A_ipd, B_ipd);
          n1_var := VitalOR2(n0_var, C_ipd);
          Y_zd := VitalINV(n1_var);


          -- Path delay section
          VitalPathDelay01(
               OutSignal     => Y,
               OutSignalName => "Y",
               OutTemp => Y_zd,
               Paths => (
                      0 => ( A_ipd'LAST_EVENT,
                             tpd_A_Y,
                             TRUE),
                      1 => ( B_ipd'LAST_EVENT,
                             tpd_B_Y,
                             TRUE),
                      2 => ( C_ipd'LAST_EVENT,
                             tpd_C_Y,
                             TRUE)),
               GlitchData => Y_GlitchData,
               Mode  => OnEvent,
               XOn            => XOn,
               MsgOn          => MsgOn,
               MsgSeverity    => WARNING );


END PROCESS;

end behavioral;


LIBRARY IEEE;
USE IEEE.Std_logic_1164.all;
USE IEEE.VITAL_Timing.all;
USE IEEE.VITAL_Primitives.all;
USE work.prim.all;

entity OAI21X1 is
   generic (
             tipd_A : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tipd_B : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tipd_C : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tpd_A_Y : VitalDelayType01 := (0.0981035 ns, 0.0869973 ns);
             tpd_B_Y : VitalDelayType01 := (0.090256 ns, 0.0643204 ns);
             tpd_C_Y : VitalDelayType01 := (0.0755506 ns, 0.0624455 ns);

             XOn            : BOOLEAN := DefCombSpikeXOn;
             MsgOn          : BOOLEAN := DefCombSpikeMsgOn;
             instancePath   : STRING  := "*" );

   port (
         A : in std_ulogic := 'U' ;
         B : in std_ulogic := 'U' ;
         C : in std_ulogic := 'U' ;
         Y : out std_ulogic);

   attribute VITAL_LEVEL0 of OAI21X1 : entity is TRUE;
end OAI21X1;

architecture behavioral of OAI21X1 is
   attribute VITAL_LEVEL1 of behavioral : architecture is TRUE;

   SIGNAL A_ipd : std_ulogic := 'X';
   SIGNAL B_ipd : std_ulogic := 'X';
   SIGNAL C_ipd : std_ulogic := 'X';

begin

--Input Path Delays
WIREDELAY : BLOCK
BEGIN
   VitalWireDelay( A_ipd, A, tipd_A );
   VitalWireDelay( B_ipd, B, tipd_B );
   VitalWireDelay( C_ipd, C, tipd_C );
END BLOCK;

VITALBehavior : PROCESS (A_ipd, B_ipd, C_ipd)


      -- functionality section variables
      VARIABLE n0_var : std_ulogic;
      VARIABLE n1_var : std_ulogic;
      VARIABLE Y_zd : std_ulogic;

      -- path delay section variables
      VARIABLE Y_GlitchData : VitalGlitchDataType;

      BEGIN
          -- Functionality section
          n0_var := VitalOR2(A_ipd, B_ipd);
          n1_var := VitalAND2(n0_var, C_ipd);
          Y_zd := VitalINV(n1_var);


          -- Path delay section
          VitalPathDelay01(
               OutSignal     => Y,
               OutSignalName => "Y",
               OutTemp => Y_zd,
               Paths => (
                      0 => ( A_ipd'LAST_EVENT,
                             tpd_A_Y,
                             TRUE),
                      1 => ( B_ipd'LAST_EVENT,
                             tpd_B_Y,
                             TRUE),
                      2 => ( C_ipd'LAST_EVENT,
                             tpd_C_Y,
                             TRUE)),
               GlitchData => Y_GlitchData,
               Mode  => OnEvent,
               XOn            => XOn,
               MsgOn          => MsgOn,
               MsgSeverity    => WARNING );


END PROCESS;

end behavioral;


LIBRARY IEEE;
USE IEEE.Std_logic_1164.all;
USE IEEE.VITAL_Timing.all;
USE IEEE.VITAL_Primitives.all;
USE work.prim.all;

entity OAI22X1 is
   generic (
             tipd_A : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tipd_B : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tipd_C : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tipd_D : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tpd_A_Y : VitalDelayType01 := (0.113978 ns, 0.0996822 ns);
             tpd_B_Y : VitalDelayType01 := (0.103071 ns, 0.0815385 ns);
             tpd_C_Y : VitalDelayType01 := (0.0898313 ns, 0.0940105 ns);
             tpd_D_Y : VitalDelayType01 := (0.081842 ns, 0.0764691 ns);

             XOn            : BOOLEAN := DefCombSpikeXOn;
             MsgOn          : BOOLEAN := DefCombSpikeMsgOn;
             instancePath   : STRING  := "*" );

   port (
         A : in std_ulogic := 'U' ;
         B : in std_ulogic := 'U' ;
         C : in std_ulogic := 'U' ;
         D : in std_ulogic := 'U' ;
         Y : out std_ulogic);

   attribute VITAL_LEVEL0 of OAI22X1 : entity is TRUE;
end OAI22X1;

architecture behavioral of OAI22X1 is
   attribute VITAL_LEVEL1 of behavioral : architecture is TRUE;

   SIGNAL A_ipd : std_ulogic := 'X';
   SIGNAL B_ipd : std_ulogic := 'X';
   SIGNAL C_ipd : std_ulogic := 'X';
   SIGNAL D_ipd : std_ulogic := 'X';

begin

--Input Path Delays
WIREDELAY : BLOCK
BEGIN
   VitalWireDelay( A_ipd, A, tipd_A );
   VitalWireDelay( B_ipd, B, tipd_B );
   VitalWireDelay( C_ipd, C, tipd_C );
   VitalWireDelay( D_ipd, D, tipd_D );
END BLOCK;

VITALBehavior : PROCESS (A_ipd, B_ipd, C_ipd, D_ipd)


      -- functionality section variables
      VARIABLE n0_var : std_ulogic;
      VARIABLE n1_var : std_ulogic;
      VARIABLE n2_var : std_ulogic;
      VARIABLE Y_zd : std_ulogic;

      -- path delay section variables
      VARIABLE Y_GlitchData : VitalGlitchDataType;

      BEGIN
          -- Functionality section
          n0_var := VitalOR2(A_ipd, B_ipd);
          n1_var := VitalOR2(C_ipd, D_ipd);
          n2_var := VitalAND2(n0_var, n1_var);
          Y_zd := VitalINV(n2_var);


          -- Path delay section
          VitalPathDelay01(
               OutSignal     => Y,
               OutSignalName => "Y",
               OutTemp => Y_zd,
               Paths => (
                      0 => ( A_ipd'LAST_EVENT,
                             tpd_A_Y,
                             TRUE),
                      1 => ( B_ipd'LAST_EVENT,
                             tpd_B_Y,
                             TRUE),
                      2 => ( C_ipd'LAST_EVENT,
                             tpd_C_Y,
                             TRUE),
                      3 => ( D_ipd'LAST_EVENT,
                             tpd_D_Y,
                             TRUE)),
               GlitchData => Y_GlitchData,
               Mode  => OnEvent,
               XOn            => XOn,
               MsgOn          => MsgOn,
               MsgSeverity    => WARNING );


END PROCESS;

end behavioral;


LIBRARY IEEE;
USE IEEE.Std_logic_1164.all;
USE IEEE.VITAL_Timing.all;
USE IEEE.VITAL_Primitives.all;
USE work.prim.all;

entity OR2X1 is
   generic (
             tipd_A : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tipd_B : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tpd_A_Y : VitalDelayType01 := (0.116621 ns, 0.122276 ns);
             tpd_B_Y : VitalDelayType01 := (0.151161 ns, 0.133001 ns);

             XOn            : BOOLEAN := DefCombSpikeXOn;
             MsgOn          : BOOLEAN := DefCombSpikeMsgOn;
             instancePath   : STRING  := "*" );

   port (
         A : in std_ulogic := 'U' ;
         B : in std_ulogic := 'U' ;
         Y : out std_ulogic);

   attribute VITAL_LEVEL0 of OR2X1 : entity is TRUE;
end OR2X1;

architecture behavioral of OR2X1 is
   attribute VITAL_LEVEL1 of behavioral : architecture is TRUE;

   SIGNAL A_ipd : std_ulogic := 'X';
   SIGNAL B_ipd : std_ulogic := 'X';

begin

--Input Path Delays
WIREDELAY : BLOCK
BEGIN
   VitalWireDelay( A_ipd, A, tipd_A );
   VitalWireDelay( B_ipd, B, tipd_B );
END BLOCK;

VITALBehavior : PROCESS (A_ipd, B_ipd)


      -- functionality section variables
      VARIABLE Y_zd : std_ulogic;

      -- path delay section variables
      VARIABLE Y_GlitchData : VitalGlitchDataType;

      BEGIN
          -- Functionality section
          Y_zd := VitalOR2(A_ipd, B_ipd);


          -- Path delay section
          VitalPathDelay01(
               OutSignal     => Y,
               OutSignalName => "Y",
               OutTemp => Y_zd,
               Paths => (
                      0 => ( A_ipd'LAST_EVENT,
                             tpd_A_Y,
                             TRUE),
                      1 => ( B_ipd'LAST_EVENT,
                             tpd_B_Y,
                             TRUE)),
               GlitchData => Y_GlitchData,
               Mode  => OnEvent,
               XOn            => XOn,
               MsgOn          => MsgOn,
               MsgSeverity    => WARNING );


END PROCESS;

end behavioral;


LIBRARY IEEE;
USE IEEE.Std_logic_1164.all;
USE IEEE.VITAL_Timing.all;
USE IEEE.VITAL_Primitives.all;
USE work.prim.all;

entity OR2X2 is
   generic (
             tipd_A : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tipd_B : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tpd_A_Y : VitalDelayType01 := (0.149923 ns, 0.151974 ns);
             tpd_B_Y : VitalDelayType01 := (0.183048 ns, 0.161913 ns);

             XOn            : BOOLEAN := DefCombSpikeXOn;
             MsgOn          : BOOLEAN := DefCombSpikeMsgOn;
             instancePath   : STRING  := "*" );

   port (
         A : in std_ulogic := 'U' ;
         B : in std_ulogic := 'U' ;
         Y : out std_ulogic);

   attribute VITAL_LEVEL0 of OR2X2 : entity is TRUE;
end OR2X2;

architecture behavioral of OR2X2 is
   attribute VITAL_LEVEL1 of behavioral : architecture is TRUE;

   SIGNAL A_ipd : std_ulogic := 'X';
   SIGNAL B_ipd : std_ulogic := 'X';

begin

--Input Path Delays
WIREDELAY : BLOCK
BEGIN
   VitalWireDelay( A_ipd, A, tipd_A );
   VitalWireDelay( B_ipd, B, tipd_B );
END BLOCK;

VITALBehavior : PROCESS (A_ipd, B_ipd)


      -- functionality section variables
      VARIABLE Y_zd : std_ulogic;

      -- path delay section variables
      VARIABLE Y_GlitchData : VitalGlitchDataType;

      BEGIN
          -- Functionality section
          Y_zd := VitalOR2(A_ipd, B_ipd);


          -- Path delay section
          VitalPathDelay01(
               OutSignal     => Y,
               OutSignalName => "Y",
               OutTemp => Y_zd,
               Paths => (
                      0 => ( A_ipd'LAST_EVENT,
                             tpd_A_Y,
                             TRUE),
                      1 => ( B_ipd'LAST_EVENT,
                             tpd_B_Y,
                             TRUE)),
               GlitchData => Y_GlitchData,
               Mode  => OnEvent,
               XOn            => XOn,
               MsgOn          => MsgOn,
               MsgSeverity    => WARNING );


END PROCESS;

end behavioral;


LIBRARY IEEE;
USE IEEE.Std_logic_1164.all;
USE IEEE.VITAL_Timing.all;
USE IEEE.VITAL_Primitives.all;
USE work.prim.all;

entity PADINC is
   generic (
             tipd_YPAD : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tpd_YPAD_DI : VitalDelayType01 := (0.152534 ns, 0.172083 ns);

             XOn            : BOOLEAN := DefCombSpikeXOn;
             MsgOn          : BOOLEAN := DefCombSpikeMsgOn;
             instancePath   : STRING  := "*" );

   port (
         YPAD : in std_ulogic := 'U' ;
         DI : out std_ulogic);

   attribute VITAL_LEVEL0 of PADINC : entity is TRUE;
end PADINC;

architecture behavioral of PADINC is
   attribute VITAL_LEVEL1 of behavioral : architecture is TRUE;

   SIGNAL YPAD_ipd : std_ulogic := 'X';

begin

--Input Path Delays
WIREDELAY : BLOCK
BEGIN
   VitalWireDelay( YPAD_ipd, YPAD, tipd_YPAD );
END BLOCK;

VITALBehavior : PROCESS (YPAD_ipd)


      -- functionality section variables
      VARIABLE DI_zd : std_ulogic;

      -- path delay section variables
      VARIABLE DI_GlitchData : VitalGlitchDataType;

      BEGIN
          -- Functionality section
          DI_zd := VitalBUF(YPAD_ipd);


          -- Path delay section
          VitalPathDelay01(
               OutSignal     => DI,
               OutSignalName => "DI",
               OutTemp => DI_zd,
               Paths => (
                      0 => ( YPAD_ipd'LAST_EVENT,
                             tpd_YPAD_DI,
                             TRUE)),
               GlitchData => DI_GlitchData,
               Mode  => OnEvent,
               XOn            => XOn,
               MsgOn          => MsgOn,
               MsgSeverity    => WARNING );


END PROCESS;

end behavioral;


LIBRARY IEEE;
USE IEEE.Std_logic_1164.all;
USE IEEE.VITAL_Timing.all;
USE IEEE.VITAL_Primitives.all;
USE work.prim.all;

entity PADINOUT is
   generic (
             tipd_DO : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tipd_OEN : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tipd_YPAD : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tpd_DO_YPAD : VitalDelayType01 := (0.592524 ns, 0.58905 ns);
             tpd_OEN_YPAD : VitalDelayType01Z := (VitalZeroDelay, VitalZeroDelay, 0.81801 ns, 1.0728 ns, 1.45459 ns, 0.65438 ns);
             tpd_YPAD_DI : VitalDelayType01 := (0.152534 ns, 0.172083 ns);

             XOn            : BOOLEAN := DefCombSpikeXOn;
             MsgOn          : BOOLEAN := DefCombSpikeMsgOn;
             instancePath   : STRING  := "*" );

   port (
         DO : in std_ulogic := 'U' ;
         OEN : in std_ulogic := 'U' ;
         DI : out std_ulogic ;
         YPAD : inout std_ulogic);

   attribute VITAL_LEVEL0 of PADINOUT : entity is TRUE;
end PADINOUT;

architecture behavioral of PADINOUT is
   attribute VITAL_LEVEL1 of behavioral : architecture is TRUE;

   SIGNAL DO_ipd : std_ulogic := 'X';
   SIGNAL OEN_ipd : std_ulogic := 'X';
   SIGNAL YPAD_ipd : std_ulogic := 'X';

begin

--Input Path Delays
WIREDELAY : BLOCK
BEGIN
   VitalWireDelay( DO_ipd, DO, tipd_DO );
   VitalWireDelay( OEN_ipd, OEN, tipd_OEN );
   VitalWireDelay( YPAD_ipd, YPAD, tipd_YPAD );
END BLOCK;

VITALBehavior : PROCESS (DO_ipd, OEN_ipd, YPAD_ipd)


      -- functionality section variables
      VARIABLE YPAD_zd : std_ulogic;
      VARIABLE DI_zd : std_ulogic;

      -- path delay section variables
      VARIABLE DI_GlitchData : VitalGlitchDataType;
      VARIABLE YPAD_GlitchData : VitalGlitchDataType;

      BEGIN
          -- Functionality section
          YPAD_zd := VitalBUFIF1(DO_ipd, OEN_ipd);

          DI_zd := VitalBUF(YPAD_ipd);


          -- Path delay section
          VitalPathDelay01(
               OutSignal     => DI,
               OutSignalName => "DI",
               OutTemp => DI_zd,
               Paths => (
                      0 => ( YPAD_ipd'LAST_EVENT,
                             tpd_YPAD_DI,
                             TRUE)),
               GlitchData => DI_GlitchData,
               Mode  => OnEvent,
               XOn            => XOn,
               MsgOn          => MsgOn,
               MsgSeverity    => WARNING );

          VitalPathDelay01Z(
               OutSignal     => YPAD,
               OutSignalName => "YPAD",
               OutTemp => YPAD_zd,
               Paths => (
                      0 => ( DO_ipd'LAST_EVENT,
                             VitalExtendToFillDelay(tpd_DO_YPAD),
                             TRUE),
                      1 => ( OEN_ipd'LAST_EVENT,
                             VitalExtendToFillDelay(tpd_OEN_YPAD),
                             TRUE)),
               GlitchData => YPAD_GlitchData,
               Mode  => OnEvent,
               XOn            => XOn,
               MsgOn          => MsgOn,
               MsgSeverity    => WARNING );


END PROCESS;

end behavioral;


LIBRARY IEEE;
USE IEEE.Std_logic_1164.all;
USE IEEE.VITAL_Timing.all;
USE IEEE.VITAL_Primitives.all;
USE work.prim.all;

entity PADOUT is
   generic (
             tipd_DO : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tpd_DO_YPAD : VitalDelayType01 := (0.592524 ns, 0.58905 ns);

             XOn            : BOOLEAN := DefCombSpikeXOn;
             MsgOn          : BOOLEAN := DefCombSpikeMsgOn;
             instancePath   : STRING  := "*" );

   port (
         DO : in std_ulogic := 'U' ;
         YPAD : out std_ulogic);

   attribute VITAL_LEVEL0 of PADOUT : entity is TRUE;
end PADOUT;

architecture behavioral of PADOUT is
   attribute VITAL_LEVEL1 of behavioral : architecture is TRUE;

   SIGNAL DO_ipd : std_ulogic := 'X';

begin

--Input Path Delays
WIREDELAY : BLOCK
BEGIN
   VitalWireDelay( DO_ipd, DO, tipd_DO );
END BLOCK;

VITALBehavior : PROCESS (DO_ipd)


      -- functionality section variables
      VARIABLE YPAD_zd : std_ulogic;

      -- path delay section variables
      VARIABLE YPAD_GlitchData : VitalGlitchDataType;

      BEGIN
          -- Functionality section
          YPAD_zd := VitalBUF(DO_ipd);


          -- Path delay section
          VitalPathDelay01(
               OutSignal     => YPAD,
               OutSignalName => "YPAD",
               OutTemp => YPAD_zd,
               Paths => (
                      0 => ( DO_ipd'LAST_EVENT,
                             tpd_DO_YPAD,
                             TRUE)),
               GlitchData => YPAD_GlitchData,
               Mode  => OnEvent,
               XOn            => XOn,
               MsgOn          => MsgOn,
               MsgSeverity    => WARNING );


END PROCESS;

end behavioral;


LIBRARY IEEE;
USE IEEE.Std_logic_1164.all;
USE IEEE.VITAL_Timing.all;
USE IEEE.VITAL_Primitives.all;
USE work.prim.all;

entity TBUFX1 is
   generic (
             tipd_A : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tipd_EN : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tpd_A_Y : VitalDelayType01 := (0.0992883 ns, 0.0768282 ns);
             tpd_EN_Y : VitalDelayType01Z := (VitalZeroDelay, VitalZeroDelay, 0.0524545 ns, 0.0954081 ns, 0.0942403 ns, 0.0373398 ns);

             XOn            : BOOLEAN := DefCombSpikeXOn;
             MsgOn          : BOOLEAN := DefCombSpikeMsgOn;
             instancePath   : STRING  := "*" );

   port (
         A : in std_ulogic := 'U' ;
         EN : in std_ulogic := 'U' ;
         Y : out std_ulogic);

   attribute VITAL_LEVEL0 of TBUFX1 : entity is TRUE;
end TBUFX1;

architecture behavioral of TBUFX1 is
   attribute VITAL_LEVEL1 of behavioral : architecture is TRUE;

   SIGNAL A_ipd : std_ulogic := 'X';
   SIGNAL EN_ipd : std_ulogic := 'X';

begin

--Input Path Delays
WIREDELAY : BLOCK
BEGIN
   VitalWireDelay( A_ipd, A, tipd_A );
   VitalWireDelay( EN_ipd, EN, tipd_EN );
END BLOCK;

VITALBehavior : PROCESS (A_ipd, EN_ipd)


      -- functionality section variables
      VARIABLE n0_var : std_ulogic;
      VARIABLE Y_zd : std_ulogic;

      -- path delay section variables
      VARIABLE Y_GlitchData : VitalGlitchDataType;

      BEGIN
          -- Functionality section
          n0_var := VitalINV(A_ipd);
          Y_zd := VitalBUFIF1(n0_var, EN_ipd);


          -- Path delay section
          VitalPathDelay01Z(
               OutSignal     => Y,
               OutSignalName => "Y",
               OutTemp => Y_zd,
               Paths => (
                      0 => ( A_ipd'LAST_EVENT,
                             VitalExtendToFillDelay(tpd_A_Y),
                             TRUE),
                      1 => ( EN_ipd'LAST_EVENT,
                             VitalExtendToFillDelay(tpd_EN_Y),
                             TRUE)),
               GlitchData => Y_GlitchData,
               Mode  => OnEvent,
               XOn            => XOn,
               MsgOn          => MsgOn,
               MsgSeverity    => WARNING );


END PROCESS;

end behavioral;


LIBRARY IEEE;
USE IEEE.Std_logic_1164.all;
USE IEEE.VITAL_Timing.all;
USE IEEE.VITAL_Primitives.all;
USE work.prim.all;

entity TBUFX2 is
   generic (
             tipd_A : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tipd_EN : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tpd_A_Y : VitalDelayType01 := (0.0994012 ns, 0.0767147 ns);
             tpd_EN_Y : VitalDelayType01Z := (VitalZeroDelay, VitalZeroDelay, 0.0524545 ns, 0.0961362 ns, 0.0935792 ns, 0.0374393 ns);

             XOn            : BOOLEAN := DefCombSpikeXOn;
             MsgOn          : BOOLEAN := DefCombSpikeMsgOn;
             instancePath   : STRING  := "*" );

   port (
         A : in std_ulogic := 'U' ;
         EN : in std_ulogic := 'U' ;
         Y : out std_ulogic);

   attribute VITAL_LEVEL0 of TBUFX2 : entity is TRUE;
end TBUFX2;

architecture behavioral of TBUFX2 is
   attribute VITAL_LEVEL1 of behavioral : architecture is TRUE;

   SIGNAL A_ipd : std_ulogic := 'X';
   SIGNAL EN_ipd : std_ulogic := 'X';

begin

--Input Path Delays
WIREDELAY : BLOCK
BEGIN
   VitalWireDelay( A_ipd, A, tipd_A );
   VitalWireDelay( EN_ipd, EN, tipd_EN );
END BLOCK;

VITALBehavior : PROCESS (A_ipd, EN_ipd)


      -- functionality section variables
      VARIABLE n0_var : std_ulogic;
      VARIABLE Y_zd : std_ulogic;

      -- path delay section variables
      VARIABLE Y_GlitchData : VitalGlitchDataType;

      BEGIN
          -- Functionality section
          n0_var := VitalINV(A_ipd);
          Y_zd := VitalBUFIF1(n0_var, EN_ipd);


          -- Path delay section
          VitalPathDelay01Z(
               OutSignal     => Y,
               OutSignalName => "Y",
               OutTemp => Y_zd,
               Paths => (
                      0 => ( A_ipd'LAST_EVENT,
                             VitalExtendToFillDelay(tpd_A_Y),
                             TRUE),
                      1 => ( EN_ipd'LAST_EVENT,
                             VitalExtendToFillDelay(tpd_EN_Y),
                             TRUE)),
               GlitchData => Y_GlitchData,
               Mode  => OnEvent,
               XOn            => XOn,
               MsgOn          => MsgOn,
               MsgSeverity    => WARNING );


END PROCESS;

end behavioral;


LIBRARY IEEE;
USE IEEE.Std_logic_1164.all;
USE IEEE.VITAL_Timing.all;
USE IEEE.VITAL_Primitives.all;
USE work.prim.all;

entity XNOR2X1 is
   generic (
             tipd_A : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tipd_B : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tpd_A_Y : VitalDelayType01 := (0.122672 ns, 0.12246 ns);
             tpd_B_Y : VitalDelayType01 := (0.148249 ns, 0.138356 ns);

             XOn            : BOOLEAN := DefCombSpikeXOn;
             MsgOn          : BOOLEAN := DefCombSpikeMsgOn;
             instancePath   : STRING  := "*" );

   port (
         A : in std_ulogic := 'U' ;
         B : in std_ulogic := 'U' ;
         Y : out std_ulogic);

   attribute VITAL_LEVEL0 of XNOR2X1 : entity is TRUE;
end XNOR2X1;

architecture behavioral of XNOR2X1 is
   attribute VITAL_LEVEL1 of behavioral : architecture is TRUE;

   SIGNAL A_ipd : std_ulogic := 'X';
   SIGNAL B_ipd : std_ulogic := 'X';

begin

--Input Path Delays
WIREDELAY : BLOCK
BEGIN
   VitalWireDelay( A_ipd, A, tipd_A );
   VitalWireDelay( B_ipd, B, tipd_B );
END BLOCK;

VITALBehavior : PROCESS (A_ipd, B_ipd)


      -- functionality section variables
      VARIABLE n0_var : std_ulogic;
      VARIABLE Y_zd : std_ulogic;

      -- path delay section variables
      VARIABLE Y_GlitchData : VitalGlitchDataType;

      BEGIN
          -- Functionality section
          n0_var := VitalXOR2(A_ipd, B_ipd);
          Y_zd := VitalINV(n0_var);


          -- Path delay section
          VitalPathDelay01(
               OutSignal     => Y,
               OutSignalName => "Y",
               OutTemp => Y_zd,
               Paths => (
                      0 => ( A_ipd'LAST_EVENT,
                             tpd_A_Y,
                             TRUE),
                      1 => ( B_ipd'LAST_EVENT,
                             tpd_B_Y,
                             TRUE)),
               GlitchData => Y_GlitchData,
               Mode  => OnEvent,
               XOn            => XOn,
               MsgOn          => MsgOn,
               MsgSeverity    => WARNING );


END PROCESS;

end behavioral;


LIBRARY IEEE;
USE IEEE.Std_logic_1164.all;
USE IEEE.VITAL_Timing.all;
USE IEEE.VITAL_Primitives.all;
USE work.prim.all;

entity XOR2X1 is
   generic (
             tipd_A : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tipd_B : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tpd_A_Y : VitalDelayType01 := (0.122933 ns, 0.122337 ns);
             tpd_B_Y : VitalDelayType01 := (0.144619 ns, 0.145193 ns);

             XOn            : BOOLEAN := DefCombSpikeXOn;
             MsgOn          : BOOLEAN := DefCombSpikeMsgOn;
             instancePath   : STRING  := "*" );

   port (
         A : in std_ulogic := 'U' ;
         B : in std_ulogic := 'U' ;
         Y : out std_ulogic);

   attribute VITAL_LEVEL0 of XOR2X1 : entity is TRUE;
end XOR2X1;

architecture behavioral of XOR2X1 is
   attribute VITAL_LEVEL1 of behavioral : architecture is TRUE;

   SIGNAL A_ipd : std_ulogic := 'X';
   SIGNAL B_ipd : std_ulogic := 'X';

begin

--Input Path Delays
WIREDELAY : BLOCK
BEGIN
   VitalWireDelay( A_ipd, A, tipd_A );
   VitalWireDelay( B_ipd, B, tipd_B );
END BLOCK;

VITALBehavior : PROCESS (A_ipd, B_ipd)


      -- functionality section variables
      VARIABLE Y_zd : std_ulogic;

      -- path delay section variables
      VARIABLE Y_GlitchData : VitalGlitchDataType;

      BEGIN
          -- Functionality section
          Y_zd := VitalXOR2(A_ipd, B_ipd);


          -- Path delay section
          VitalPathDelay01(
               OutSignal     => Y,
               OutSignalName => "Y",
               OutTemp => Y_zd,
               Paths => (
                      0 => ( A_ipd'LAST_EVENT,
                             tpd_A_Y,
                             TRUE),
                      1 => ( B_ipd'LAST_EVENT,
                             tpd_B_Y,
                             TRUE)),
               GlitchData => Y_GlitchData,
               Mode  => OnEvent,
               XOn            => XOn,
               MsgOn          => MsgOn,
               MsgSeverity    => WARNING );


END PROCESS;

end behavioral;



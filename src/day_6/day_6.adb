with Ada.Text_IO; use Ada.Text_IO;
with Types; use Types;
with Day_6.Parser; use Day_6.Parser;
with Day_6.Worksheets; use Day_6.Worksheets;

package body Day_6 is
   procedure Run is
      WS : Worksheet;
   begin
      WS := Read_Worksheet ("./data/day_6.txt");
      Put_Line ("Standard total is" & U64'Image (Solve (To_Columns (WS))));
      Put_Line ("Rotated total is" & U64'Image (Solve (To_Rotated_Columns (WS))));
   end Run;
end Day_6;

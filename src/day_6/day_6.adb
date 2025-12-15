with Ada.Text_IO; use Ada.Text_IO;
with Types; use Types;
with Day_6.Parser; use Day_6.Parser;
with Day_6.Worksheets; use Day_6.Worksheets;

package body Day_6 is
   procedure Run is
      WS : Worksheet;
   begin
      WS := Read_Worksheet ("./data/day_6.txt");
      Put_Line (WS'Image);
      Put_Line (Column_Vectors.Vector'Image (To_Columns (WS)));
   end Run;
end Day_6;

with Ada.Text_IO; use Ada.Text_IO;
with Day_9.Parser; use Day_9.Parser;
with Day_9.Floors; use Day_9.Floors;
with Types; use Types;

package body Day_9 is
   procedure Run is
      F : Floor;
   begin
      F := Read_Floor ("./data/day_9.txt");
      Put_Line ("Largest floor" & U64'Image (Largest_Area (F)));
      Put_Line ("Largest floor inside bounds" & U64'Image (Largest_Area_In_Lines (F)));
   end Run;
end Day_9;

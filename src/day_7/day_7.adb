with Ada.Text_IO; use Ada.Text_IO;
with Types; use Types;
with Day_7.Parser; use Day_7.Parser;
with Day_7.Manifolds; use Day_7.Manifolds;

package body Day_7 is
   procedure Run is
      M : Manifold;
   begin
      M := Read_Manifold ("./data/day_7.txt");
      Put_Line ("Total splitters hit" & Natural'Image (Count_Splits (M)));
      Put_Line ("Total timelines hit" & U64'Image (Count_Timelines (M)));
   end Run;
end Day_7;

with Ada.Text_IO; use Ada.Text_IO;
with Day_8.Parser; use Day_8.Parser;
with Day_8.Circuits; use Day_8.Circuits;

package body Day_8 is
   procedure Run is
      C : Circuit;
   begin
      C := Read_Circuit ("./data/day_8.txt");
      Put_Line ("Three largest lengths, multiplied" & Natural'Image (Calculate_Three_Largest (C, 1000)));
   end Run;
end Day_8;

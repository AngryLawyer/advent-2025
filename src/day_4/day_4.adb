with Ada.Text_IO; use Ada.Text_IO;
with Day_4.Racks; use Day_4.Racks;
with Day_4.Parser; use Day_4.Parser;

package body Day_4 is
   procedure Run is
      R : Rack;
   begin
      R := Read_Rack ("./data/day_4.txt");
      Put_Line ("Accessible scrolls" & Natural'Image (Total_Accessible (R)));
      Put_Line ("Accessible scrolls with removal" & Natural'Image (Total_Accessible_With_Removal (R)));
   end Run;
end Day_4;

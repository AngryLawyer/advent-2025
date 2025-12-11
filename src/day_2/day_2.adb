with Ada.Text_IO; use Ada.Text_IO;
with Day_2.Product_Ranges;
with Day_2.Parser;
with Day_2.Numerics; use Day_2.Numerics;

package body Day_2 is
   procedure Run is
      use Day_2.Product_Ranges;
      use Day_2.Parser;
      Ranges : Product_Range_Vectors.Vector;
   begin
      Ranges := Read_Ranges ("./data/day_2.txt");
      Put_Line ("Total invalid ids" & Long_Natural'Image (Total_Of_Invalid_Ids (Ranges, False)));
      Put_Line ("Total invalid ids part 2" & Long_Natural'Image (Total_Of_Invalid_Ids (Ranges, True)));
   end Run;
end Day_2;

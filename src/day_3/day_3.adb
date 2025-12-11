with Ada.Text_IO; use Ada.Text_IO;
with Day_3.Banks;
with Day_3.Parser;

package body Day_3 is
   procedure Run is
      use Day_3.Banks;
      use Day_3.Parser;
      Banks : Bank_Vectors.Vector;
   begin
      Banks := Read_Banks ("./data/day_3.txt");
      Put_Line ("Total Joltage" & Natural'Image (Total_Joltage (Banks)));
   end Run;
end Day_3;

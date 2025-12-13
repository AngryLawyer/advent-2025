with Ada.Text_IO; use Ada.Text_IO;
with Day_3.Banks; use Day_3.Banks;
with Day_3.Parser; use Day_3.Parser;
with Types; use Types;

package body Day_3 is
   procedure Run is
      Banks : Bank_Vectors.Vector;
   begin
      Banks := Read_Banks ("./data/day_3.txt");
      Put_Line ("Total Joltage" & U64'Image (Total_Joltage (Banks, False)));
      Put_Line ("Total Joltage with Safety Override" & U64'Image (Total_Joltage (Banks, True)));
   end Run;
end Day_3;

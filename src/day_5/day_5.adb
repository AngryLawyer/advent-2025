with Ada.Text_IO; use Ada.Text_IO;
with Day_5.Parser; use Day_5.Parser;
with Day_5.Databases; use Day_5.Databases;
with Types; use Types;

package body Day_5 is
   procedure Run is
      DB : Database;
   begin
      DB := Read_Database ("./data/day_5.txt");
      Put_Line ("Total fresh ingredients is" & Natural'Image (Freshness_Count (DB)));
      Put_Line ("Total all possible fresh ingredients is" & U64'Image (All_Possible_Freshness_Count (DB)));
   end Run;
end Day_5;

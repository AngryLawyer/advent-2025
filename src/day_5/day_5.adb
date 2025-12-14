with Ada.Text_IO; use Ada.Text_IO;
with Day_5.Parser; use Day_5.Parser;
with Day_5.Databases; use Day_5.Databases;

package body Day_5 is
   procedure Run is
      DB : Database;
   begin
      DB := Load_Database ("./data/day_5.txt");
      Put_Line ("Total fresh ingredients is" & Natural'Image (Freshness_Count (DB)));
   end Run;
end Day_5;

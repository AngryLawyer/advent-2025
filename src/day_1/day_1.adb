with Day_1.Safe;
with Day_1.Parser;

with Ada.Text_IO; use Ada.Text_IO;

package body Day_1 is
   procedure Run is
      Safe     : Day_1.Safe.Safe;
      Commands : Day_1.Parser.Rotation_Vectors.Vector;
   begin
      Safe := Day_1.Safe.Init (50);
      Commands := Day_1.Parser.Read_Directions ("./data/day_1.txt");
      for E of Commands loop
         Day_1.Safe.Apply (Safe, E);
      end loop;
      Put_Line
        ("Position is"
         & Day_1.Safe.Safe_Position'Image (Day_1.Safe.Position (Safe)));
      Put_Line ("Password is" & Integer'Image (Day_1.Safe.Exact_Count (Safe)));
      Put_Line ("Passes is" & Integer'Image (Day_1.Safe.Pass_Count (Safe)));
   end Run;
end Day_1;

with Ada.Text_IO; use Ada.Text_IO;
with GNAT.String_Split; use GNAT;
with Types; use Types;
with Ranges; use Ranges;

package body Day_2.Parser is
   procedure Parse_Line (Collector : in out Product_Range_Vectors.Vector; Line : String) is
      Subs : String_Split.Slice_Set;
      Seps : constant String := ",";
   begin
      String_Split.Create (S => Subs,
                           From => Line,
                           Separators => Seps,
                           Mode => String_Split.Multiple);
      for I in 1 .. String_Split.Slice_Count (Subs) loop
         Collector.Append (Parse_Range (String_Split.Slice (Subs, I)));
      end loop;
   end Parse_Line;
end Day_2.Parser;

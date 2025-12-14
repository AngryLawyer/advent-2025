with Ada.Text_IO; use Ada.Text_IO;
with GNAT.String_Split; use GNAT;
with Types; use Types;

package body Day_2.Parser is

   function Parse_Range (Raw : String) return Product_Range is
      Subs : GNAT.String_Split.Slice_Set;
      Seps : constant String := "-";
      Output : Product_Range;
   begin
      String_Split.Create (S => Subs,
                           From => Raw,
                           Separators => Seps,
                           Mode => String_Split.Multiple);

      if Integer (String_Split.Slice_Count (Subs)) /= 2 then
         raise Parse_Error;
      end if;

      Output.Left := U64'Value (String_Split.Slice (Subs, 1));
      Output.Right := U64'Value (String_Split.Slice (Subs, 2));

      return Output;
   end Parse_Range;

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

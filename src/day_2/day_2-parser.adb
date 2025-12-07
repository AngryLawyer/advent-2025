with Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings.Fixed;
with GNAT.String_Split; use GNAT;

package body Day_2.Parser is

   function Parse_Range (Raw : String) return Day_2.Product_Range.Product_Range is
      Subs : GNAT.String_Split.Slice_Set;
      Seps : constant String := "-";
      Output : Day_2.Product_Range.Product_Range;
   begin
      String_Split.Create (S => Subs,
                           From => Raw,
                           Separators => Seps,
                           Mode => String_Split.Multiple);

      if Integer (String_Split.Slice_Count (Subs)) /= 2 then
         raise Parse_Error;
      end if;

      Output.Left := Positive'Value (String_Split.Slice (Subs, 1));
      Output.Right := Positive'Value (String_Split.Slice (Subs, 2));

      return Output;
   end Parse_Range;

   function Read_Ranges (Path : String) return Product_Range_Vectors.Vector is
      V : Product_Range_Vectors.Vector;
      F : File_Type;
      Subs : String_Split.Slice_Set;
      Seps : constant String := ",";
   begin
      Open (F, In_File, Path);
      while not End_Of_File (F) loop
         String_Split.Create (S => Subs,
                              From => Get_Line (F),
                              Separators => Seps,
                              Mode => String_Split.Multiple);
         for I in 1 .. String_Split.Slice_Count (Subs) loop
            V.Append (Parse_Range (String_Split.Slice (Subs, I)));
         end loop;
      end loop;
      return V;
   end Read_Ranges;
end Day_2.Parser;

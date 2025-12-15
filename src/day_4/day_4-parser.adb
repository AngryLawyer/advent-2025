with Ada.Text_IO; use Ada.Text_IO;

package body Day_4.Parser is
   function Parse_Rack (Raw : String_Vectors.Vector) return Rack is
      Scrolls : Coordinate_Sets.Set;
      Width : Positive;
      Height : Positive;
   begin
      Height := Positive (Raw.Length);
      declare
         S : constant String := Raw (1);
      begin
         Width := S'Length;
      end;

      for Line_Index in Raw.First_Index .. Raw.Last_Index loop
         declare
            Line : constant String := Raw (Line_Index);
         begin
            for Char_Index in Line'Range loop
               if Line (Char_Index) = '@' then
                  Scrolls.Insert ((Char_Index, Line_Index));
               end if;
            end loop;
         end;
      end loop;

      return (
         Scrolls => Scrolls,
         Width => Width,
         Height => Height
      );
   end Parse_Rack;

   function Read_Rack (Path : String) return Rack is
      V : String_Vectors.Vector;
      F : File_Type;
   begin
      Open (F, In_File, Path);
      while not End_Of_File (F) loop
         V.Append (Get_Line (F));
      end loop;
      Close (F);
      return Parse_Rack (V);
   end Read_Rack;
end Day_4.Parser;

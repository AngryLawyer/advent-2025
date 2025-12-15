with Ada.Text_IO; use Ada.Text_IO;

package body Parsers is
   function Parse (Raw : String_Vectors.Vector) return T is
      Collector : T;
   begin
      for Line of Raw loop
         Parse_Line (Collector, Line);
      end loop;
      return Collector;
   end Parse;

   function Load (Path : String) return T is
      Collector : T;
      F : File_Type;
   begin
      Open (F, In_File, Path);
      while not End_Of_File (F) loop
         Parse_Line (Collector, Get_Line (F));
      end loop;
      Close (F);
      return Collector;
   end Load;
end Parsers;

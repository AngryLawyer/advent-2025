with Ada.Text_IO; use Ada.Text_IO;

package body Parsers is
   function Parse (Raw : String_Vectors.Vector) return T is
      Collector : T;
   begin
      for I in Raw.First_Index .. Raw.Last_Index loop
         Parse_Line (Collector, Raw (I), I);
      end loop;
      return Collector;
   end Parse;

   function Load (Path : String) return T is
      Collector : T;
      F : File_Type;
      I : Positive := 1;
   begin
      Open (F, In_File, Path);
      while not End_Of_File (F) loop
         Parse_Line (Collector, Get_Line (F), I);
         I := I + 1;
      end loop;
      Close (F);
      return Collector;
   end Load;
end Parsers;

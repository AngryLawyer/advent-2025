with Ada.Text_IO; use Ada.Text_IO;

package body Day_5.Parser is
   function Parse_Database (V : String_Vectors.Vector) return Database is
      DB : Database;
   begin
      return DB;
   end Parse_Database;

   function Load_Database (Path : String) return Database is
      V : String_Vectors.Vector;
      F : File_Type;
   begin
      Open (F, In_File, Path);
      while not End_Of_File (F) loop
         V.Append (Get_Line (F));
      end loop;
      Close (F);
      return Parse_Database (V);
   end Load_Database;
end Day_5.Parser;

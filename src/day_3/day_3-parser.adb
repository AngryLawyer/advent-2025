with Ada.Text_IO; use Ada.Text_IO;

package body Day_3.Parser is
   function Parse_Bank (Raw : String) return Bank is
      -- TODO: It would be nice to have a postcondition in here
      B : Bank;
   begin
      for I in Raw'Range loop
         B.Append (Natural'Value ((1 => Raw (I))));
      end loop;
      return B;
   end Parse_Bank;

   function Read_Banks (Path : String) return Bank_Vectors.Vector is
      V : Bank_Vectors.Vector;
      F : File_Type;
   begin
      Open (F, In_File, Path);
      while not End_Of_File (F) loop
         V.Append (Parse_Bank (Get_Line (F)));
      end loop;
      return V;
   end Read_Banks;
end Day_3.Parser;

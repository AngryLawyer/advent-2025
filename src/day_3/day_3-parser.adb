with Ada.Text_IO; use Ada.Text_IO;

package body Day_3.Parser is
   function Parse_Bank (Raw : String) return Bank is
      -- TODO: It would be nice to have a postcondition in here
      B : Bank;
   begin
      for I in Raw'Range loop
         B.Append (Natural'Value ([1 => Raw (I)]));
      end loop;
      return B;
   end Parse_Bank;

   procedure Parse_Line (Collector : in out Bank_Vectors.Vector; Raw : String; Line : Positive) is
   begin
      Collector.Append (Parse_Bank (Raw));
   end Parse_Line;
end Day_3.Parser;

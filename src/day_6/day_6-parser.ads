with Types; use Types;
with Parsers;
with Day_6.Worksheets; use Day_6.Worksheets;

package Day_6.Parser is
   Parse_Error : exception;

   procedure Parse_Line (Collector : in out Worksheet; Line : String);

   package P is new Parsers (
      T => Worksheet,
      Parse_Line => Parse_Line
   );

   function Parse (Raw : String_Vectors.Vector) return Worksheet renames P.Parse;
   function Read_Worksheet (Path : String) return Worksheet renames P.Load;
end Day_6.Parser;

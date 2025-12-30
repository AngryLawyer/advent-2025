with Types; use Types;
with Parsers;
with Day_9.Floors; use Day_9.Floors;

package Day_9.Parser is
   procedure Parse_Line (Collector : in out Floor; Raw : String; Line : Positive);

   package P is new Parsers (
      T => Floor,
      Parse_Line => Parse_Line
   );
   Parse_Error : exception renames P.Parse_Error;
   function Parse (Raw : String_Vectors.Vector) return Floor renames P.Parse;
   function Read_Floor (Path : String) return Floor renames P.Load;
end Day_9.Parser;

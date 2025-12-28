with Types; use Types;
with Parsers;
with Day_8.Circuits; use Day_8.Circuits;

package Day_8.Parser is
   procedure Parse_Line (Collector : in out Circuit; Raw : String; Line : Positive);

   package P is new Parsers (
      T => Circuit,
      Parse_Line => Parse_Line
   );
   Parse_Error : exception renames P.Parse_Error;
   function Parse (Raw : String_Vectors.Vector) return Circuit renames P.Parse;
   function Read_Circuit (Path : String) return Circuit renames P.Load;
end Day_8.Parser;

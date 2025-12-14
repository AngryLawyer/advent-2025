with Types; use Types;
with Day_5.Databases; use Day_5.Databases;

package Day_5.Parser is
   procedure Parse_Line (Collector : in out Database; Line : String);

   package P is new Parsers (
      T => Database,
      Parse_Line => Parse_Line
   );

   function Parse (Raw : String_Vectors.Vector) return Database renames P.Parse;
   function Read_Database (Path : String) return Database renames P.Load;
end Day_5.Parser;

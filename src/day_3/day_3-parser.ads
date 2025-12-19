with Day_3.Banks; use Day_3.Banks;
with Types; use Types;
with Parsers;

package Day_3.Parser is
   function Parse_Bank (Raw : String) return Bank;
   procedure Parse_Line (Collector : in out Bank_Vectors.Vector; Raw : String; Line : Positive);

   package P is new Parsers (
      T => Bank_Vectors.Vector,
      Parse_Line => Parse_Line
   );

   function Parse (Raw : String_Vectors.Vector) return Bank_Vectors.Vector renames P.Parse;
   function Read_Banks (Path : String) return Bank_Vectors.Vector renames P.Load;
end Day_3.Parser;

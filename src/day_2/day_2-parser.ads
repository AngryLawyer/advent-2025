with Day_2.Product_Ranges; use Day_2.Product_Ranges;
with Types; use Types;
with Parsers;

package Day_2.Parser is
   Parse_Error : exception;

   procedure Parse_Line (Collector : in out Product_Range_Vectors.Vector; Raw : String; Line : Positive);

   package P is new Parsers (
      T => Product_Range_Vectors.Vector,
      Parse_Line => Parse_Line
   );

   function Parse (Raw : String_Vectors.Vector) return Product_Range_Vectors.Vector renames P.Parse;
   function Read_Ranges (Path : String) return Product_Range_Vectors.Vector renames P.Load;
end Day_2.Parser;

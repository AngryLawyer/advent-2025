with Day_2.Product_Ranges; use Day_2.Product_Ranges;
with Types; use Types;
with Parsers;

package Day_2.Parser is
   Parse_Error : exception;

   function Parse_Range (Raw : String) return Product_Range;
   procedure Parse_Line (Collector : in out Product_Range_Vectors.Vector; Line : String);

   package P is new Parsers (
      T => Product_Range_Vectors.Vector,
      Parse_Line => Parse_Line
   );

   function Parse (Raw : String_Vectors.Vector) return Product_Range_Vectors.Vector renames P.Parse;
   function Read_Ranges (Path : String) return Product_Range_Vectors.Vector renames P.Load;
end Day_2.Parser;

with Ada.Containers.Vectors;
with Day_2.Product_Ranges; use Day_2.Product_Ranges;

package Day_2.Parser is
   Parse_Error : exception;

   function Parse_Range (Raw : String) return Product_Range;
   function Read_Ranges (Path : String) return Product_Range_Vectors.Vector;
end Day_2.Parser;

with Ada.Containers.Vectors;
with Day_2.Product_Range;

package Day_2.Parser is
   Parse_Error : exception;

   package Product_Range_Vectors is new
     Ada.Containers.Vectors
       (Index_Type   => Natural,
        Element_Type => Day_2.Product_Range.Product_Range,
        "="          => Day_2.Product_Range."=");

   function Parse_Range (Raw : String) return Day_2.Product_Range.Product_Range;
   function Read_Ranges (Path : String) return Product_Range_Vectors.Vector;
end Day_2.Parser;

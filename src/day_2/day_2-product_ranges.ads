with Ada.Containers.Ordered_Sets;
with Ada.Containers.Vectors;
with Day_2.Numerics; use Day_2.Numerics;

package Day_2.Product_Ranges is
   package Long_Natural_Sets is new
     Ada.Containers.Ordered_Sets
       (Element_Type => Long_Natural);

   type Product_Range is record
      Left  : Long_Natural;
      Right : Long_Natural;
   end record;

   package Product_Range_Vectors is new
     Ada.Containers.Vectors
       (Index_Type   => Natural,
        Element_Type => Product_Range,
        "="          => "=");

   function Count_Digits (N : Long_Natural) return Natural;
   function Duplicated (N : Long_Natural; Size : Positive; Repetitions : Positive) return Long_Natural;
   function Invalid_Ids (R : Product_Range; Any_Repeated : Boolean) return Long_Natural_Sets.Set;
   function Total_Of_Invalid_Ids (RS : Product_Range_Vectors.Vector; Any_Repeated : Boolean) return Long_Natural;
end Day_2.Product_Ranges;

with Ada.Containers.Ordered_Sets;
with Ada.Containers.Vectors;
with Day_2.Numerics; use Day_2.Numerics;
with Types; use Types;

package Day_2.Product_Ranges is
   package U64_Sets is new
     Ada.Containers.Ordered_Sets
       (Element_Type => U64);

   type Product_Range is record
      Left  : U64;
      Right : U64;
   end record;

   package Product_Range_Vectors is new
     Ada.Containers.Vectors
       (Index_Type   => Natural,
        Element_Type => Product_Range,
        "="          => "=");

   function Count_Digits (N : U64) return Natural;
   function Duplicated (N : U64; Size : Positive; Repetitions : Positive) return U64;
   function Invalid_Ids (R : Product_Range; Any_Repeated : Boolean) return U64_Sets.Set;
   function Total_Of_Invalid_Ids (RS : Product_Range_Vectors.Vector; Any_Repeated : Boolean) return U64;
end Day_2.Product_Ranges;

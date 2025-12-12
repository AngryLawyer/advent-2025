with Ada.Containers.Vectors;
with Ada.Containers.Ordered_Sets;

package Day_2.Numerics is
   package Positive_Vectors is new
     Ada.Containers.Vectors
       (Element_Type => Positive,
        Index_Type => Positive);

   package Positive_Sets is new
     Ada.Containers.Ordered_Sets
       (Element_Type => Positive);

   function Factors (N : Positive) return Positive_Sets.Set;
end Day_2.Numerics;

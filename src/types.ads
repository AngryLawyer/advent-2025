with Ada.Containers.Vectors;
with Ada.Containers.Indefinite_Vectors;

package Types is
   type U64 is range 0 .. 2 ** 64;
   type I64 is range -2 ** 63 + 1 .. +2 ** 63 - 1;

   package String_Vectors is new Ada.Containers.Indefinite_Vectors (Positive, String);
   package U64_Vectors is new Ada.Containers.Vectors (Positive, U64);
   package Natural_Vectors is new Ada.Containers.Vectors (Positive, Natural);
   package Natural_Vectors_Reverse_Sorting is new Natural_Vectors.Generic_Sorting ("<" => ">");
end Types;

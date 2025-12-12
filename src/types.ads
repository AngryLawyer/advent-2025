with Ada.Containers.Indefinite_Vectors;

package Types is
   type U64 is mod 2 ** 64;

   package String_Vectors is new Ada.Containers.Indefinite_Vectors (Positive, String);
end Types;

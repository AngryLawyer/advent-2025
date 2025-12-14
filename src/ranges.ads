with Ada.Containers.Vectors;
with Optional.Values;
with Types; use Types;

package Ranges is
   type U64_Range is record
      Left  : U64;
      Right : U64;
   end record;

   package U64_Range_Vectors is new Ada.Containers.Vectors (Positive, U64_Range);

   package Opt_U64_Range is new Optional.Values (U64_Range, U64_Range'Image);

   function Overlapped (Left : U64_Range; Right : U64_Range) return Opt_U64_Range.Optional;
end Ranges;

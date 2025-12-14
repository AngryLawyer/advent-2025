with Ada.Containers.Vectors;
with Optional.Values;
with Types; use Types;

package Ranges is
   Parse_Error : exception;

   type U64_Range is record
      Left  : U64;
      Right : U64;
   end record;

   package U64_Range_Vectors is new Ada.Containers.Vectors (Positive, U64_Range);
   package Opt_U64_Range is new Optional.Values (U64_Range, U64_Range'Image);
   function Parse_Range (Raw : String) return U64_Range;

   function Overlapped (A : U64_Range; B : U64_Range) return Opt_U64_Range.Optional;
   function Includes (R : U64_Range; V : U64) return Boolean;

   function Size (R : U64_Range) return U64;
end Ranges;

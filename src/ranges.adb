with GNAT.String_Split; use GNAT;

package body Ranges is
   function Parse_Range (Raw : String) return U64_Range is
      Subs : GNAT.String_Split.Slice_Set;
      Seps : constant String := "-";
      Output : U64_Range;
   begin
      String_Split.Create (S => Subs,
                           From => Raw,
                           Separators => Seps,
                           Mode => String_Split.Multiple);

      if Integer (String_Split.Slice_Count (Subs)) /= 2 then
         raise Parse_Error;
      end if;

      Output.Left := U64'Value (String_Split.Slice (Subs, 1));
      Output.Right := U64'Value (String_Split.Slice (Subs, 2));

      return Output;
   end Parse_Range;

   function Overlapped (A : U64_Range; B : U64_Range) return Opt_U64_Range.Optional is
   begin
      if A.Right < B.Left or else B.Right < A.Left then
         return Opt_U64_Range.Empty;
      end if;
      return Opt_U64_Range.Unit ((U64'Min (A.Left, B.Left), U64'Max (A.Right, B.Right)));
   end Overlapped;

   function Includes (R : U64_Range; V : U64) return Boolean is
   begin
      return ((V >= R.Left) and then (V <= R.Right));
   end Includes;

   function Size (R : U64_Range) return U64 is
   begin
      return R.Right - R.Left + 1;
   end Size;
end Ranges;

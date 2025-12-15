with Trendy_Test;
with Trendy_Test.Assertions;
with Stringly_Asserts;

with Ranges; use Ranges;

package body Ranges.Tests is
   package Opt_Range_Assertions
      is new Stringly_Asserts (
         Element_Type => Opt_U64_Range.Optional,
         Image => Opt_U64_Range.Image
      );
   use Opt_Range_Assertions;

   procedure Test_Overlapped (T : in out Trendy_Test.Operation'Class) is
   begin
      T.Register;
      Assert_EQ (T, Overlapped ((1, 2), (3, 4)), Opt_U64_Range.Empty);
      Assert_EQ (T, Overlapped ((3, 4), (1, 2)), Opt_U64_Range.Empty);
      Assert_EQ (T, Overlapped ((1, 3), (3, 4)), Opt_U64_Range.Unit ((1, 4)));
      Assert_EQ (T, Overlapped ((3, 4), (1, 3)), Opt_U64_Range.Unit ((1, 4)));
      Assert_EQ (T, Overlapped ((1, 4), (2, 3)), Opt_U64_Range.Unit ((1, 4)));
      Assert_EQ (T, Overlapped ((2, 3), (1, 4)), Opt_U64_Range.Unit ((1, 4)));
   end Test_Overlapped;

   function All_Tests return Trendy_Test.Test_Group is
   begin
      return
         [
            Test_Overlapped'Access
         ];
   end All_Tests;
end Ranges.Tests;

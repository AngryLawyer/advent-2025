package body Day_12.Tests is
   procedure Test_Example (T : in out Trendy_Test.Operation'Class) is
   begin
      T.Register;
   end Test_Example;
   function All_Tests return Trendy_Test.Test_Group is
   begin
      return
         [
            Test_Example'Access
         ];
   end All_Tests;
end Day_12.Tests;

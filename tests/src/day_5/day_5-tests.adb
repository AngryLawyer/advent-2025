with Trendy_Test;
with Trendy_Test.Assertions.Integer_Assertions;

use Trendy_Test.Assertions;
use Trendy_Test.Assertions.Integer_Assertions;
with Types; use Types;
with Day_5.Databases; use Day_5.Databases;
with Day_5.Parser; use Day_5.Parser;

package body Day_5.Tests is
   Raw : constant String_Vectors.Vector := [
      "3-5",
      "10-14",
      "16-20",
      "12-18",
      "",
      "1",
      "5",
      "8",
      "11",
      "17",
      "32"
   ];

   procedure Test_Example (T : in out Trendy_Test.Operation'Class) is
      DB : Database;
   begin
      T.Register;
      DB := Parse_Database (Raw);
      Assert_EQ (T, Freshness_Count (DB), 3);
   end Test_Example;

   function All_Tests return Trendy_Test.Test_Group is
   begin
      return
         [
            Test_Example'Access
         ];
   end All_Tests;
end Day_5.Tests;

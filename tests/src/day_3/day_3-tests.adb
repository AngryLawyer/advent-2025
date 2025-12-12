with Trendy_Test;
with Trendy_Test.Assertions.Integer_Assertions;

use Trendy_Test.Assertions;
use Trendy_Test.Assertions.Integer_Assertions;
with Stringly_Asserts;

with Ada.Text_IO; use Ada.Text_IO;
with Day_3.Parser; use Day_3.Parser;
with Day_3.Banks; use Day_3.Banks;

package body Day_3.Tests is
   package Bank_Assertions
      is new Stringly_Asserts (
         Element_Type => Bank,
         Image => Bank'Image
      );

   use Bank_Assertions;

   Bank_Array : constant String_Vectors.Vector := [
      "987654321111111",
      "811111111111119",
      "234234234234278",
      "818181911112111"
   ];

   procedure Test_Parse_Bank (T : in out Trendy_Test.Operation'Class) is
   begin
      T.Register;
      Assert_EQ (T, Parse_Bank ("123"), [1, 2, 3]);
   end Test_Parse_Bank;

   procedure Test_Joltage (T : in out Trendy_Test.Operation'Class) is
   begin
      T.Register;
      Assert_EQ (T, Joltage (Parse_Bank ("987654321111111"), False), 98);
      Assert_EQ (T, Joltage (Parse_Bank ("811111111111119"), False), 89);
      Assert_EQ (T, Joltage (Parse_Bank ("234234234234278"), False), 78);
      Assert_EQ (T, Joltage (Parse_Bank ("818181911112111"), False), 92);
   end Test_Joltage;

   procedure Test_Joltage_Extended (T : in out Trendy_Test.Operation'Class) is
   begin
      T.Register;
      Assert_EQ (T, Joltage (Parse_Bank ("987654321111111"), True), 987654321111);
      Assert_EQ (T, Joltage (Parse_Bank ("811111111111119"), True), 811111111119);
      Assert_EQ (T, Joltage (Parse_Bank ("234234234234278"), True), 434234234278);
      Assert_EQ (T, Joltage (Parse_Bank ("818181911112111"), True), 888911112111);
   end Test_Joltage_Extended;

   procedure Test_Example (T : in out Trendy_Test.Operation'Class) is
      Parsed_Bank_Array : Bank_Vectors.Vector;
   begin
      T.Register;
      for Raw of Bank_Array loop
         Parsed_Bank_Array.Append (Parse_Bank (Raw));
      end loop;
      Assert_EQ (T, Total_Joltage (Parsed_Bank_Array, False), 357);
   end Test_Example;

   procedure Test_Example_Extended (T : in out Trendy_Test.Operation'Class) is
      Parsed_Bank_Array : Bank_Vectors.Vector;
   begin
      T.Register;
      for Raw of Bank_Array loop
         Parsed_Bank_Array.Append (Parse_Bank (Raw));
      end loop;
      Assert_EQ (T, Total_Joltage (Parsed_Bank_Array, True), 3121910778619);
   end Test_Example_Extended;

   function All_Tests return Trendy_Test.Test_Group is
   begin
      return
         [
            Test_Parse_Bank'Access,
            Test_Joltage'Access,
            Test_Joltage_Extended'Access,
            Test_Example'Access,
            Test_Example_Extended'Access
         ];
   end All_Tests;
end Day_3.Tests;

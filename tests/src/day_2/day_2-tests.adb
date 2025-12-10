with Trendy_Test;
with Trendy_Test.Assertions.Integer_Assertions;
with Trendy_Test.Assertions.Discrete;

use Trendy_Test.Assertions;
use Trendy_Test.Assertions.Integer_Assertions;

with Day_2.Parser;
with Day_2.Product_Ranges;

with Ada.Text_IO; use Ada.Text_IO;

package body Day_2.Tests is
   use Day_2.Product_Ranges;
   use Day_2.Parser;
   package Long_Integer_Assertions
       is new Trendy_Test.Assertions.Discrete (Long_Integer);

   Range_Array : constant String_Vectors.Vector := [
      "11-22",
      "95-115",
      "998-1012",
      "1188511880-1188511890",
      "222220-222224",
      "1698522-1698528",
      "446443-446449",
      "38593856-38593862",
      "565653-565659",
      "824824821-824824827",
      "2121212118-2121212124"
   ];

   procedure Assert_Set_EQ (
      T : in out Trendy_Test.Operation'Class;
      Left : Natural_Sets.Set; Right : Natural_Sets.Set) is
   begin
      Assert_EQ (T, Natural_Sets.Set'Image (Left), Natural_Sets.Set'Image (Right));
   end Assert_Set_EQ;

   procedure Test_Example (T : in out Trendy_Test.Operation'Class) is
      Ranges : Product_Range_Vectors.Vector;
   begin
      T.Register;
      for R of Range_Array loop
         Ranges.Append (Parse_Range (R));
      end loop;
      Long_Integer_Assertions.Assert_EQ (T, Total_Of_Invalid_Ids (Ranges, False), 1227775554);
   end Test_Example;

   procedure Test_Example_Extended (T : in out Trendy_Test.Operation'Class) is
      Ranges : Product_Range_Vectors.Vector;
   begin
      T.Register;
      for R of Range_Array loop
         Ranges.Append (Parse_Range (R));
      end loop;
      Long_Integer_Assertions.Assert_EQ (T, Total_Of_Invalid_Ids (Ranges, True), 4174379265);
   end Test_Example_Extended;

   procedure Test_Invalid_Ids (T : in out Trendy_Test.Operation'Class) is
   begin
      T.Register;
      Assert_Set_EQ (T,  Invalid_Ids ((11, 22), False), [11, 22]);
      Assert_Set_EQ (T,  Invalid_Ids ((95, 115), False), [99]);
      Assert_Set_EQ (T,  Invalid_Ids ((998, 1012), False), [1010]);
      Assert_Set_EQ (T,  Invalid_Ids ((1188511880, 1188511890), False), [1188511885]);
      Assert_Set_EQ (T,  Invalid_Ids ((222220, 222224), False), [222222]);
      Assert_Set_EQ (T,  Invalid_Ids ((1698522, 1698528), False), []);
      Assert_Set_EQ (T,  Invalid_Ids ((446443, 446449), False), [446446]);
      Assert_Set_EQ (T,  Invalid_Ids ((38593856, 38593862), False), [38593859]);
      Assert_Set_EQ (T,  Invalid_Ids ((565653, 565659), False), []);
      Assert_Set_EQ (T,  Invalid_Ids ((824824821, 824824827), False), []);
      Assert_Set_EQ (T,  Invalid_Ids ((2121212118, 2121212124), False), []);
   end Test_Invalid_Ids;

   procedure Test_Invalid_Ids_Extended (T : in out Trendy_Test.Operation'Class) is
   begin
      T.Register;
      Assert_Set_EQ (T,  Invalid_Ids ((11, 22), True), [11, 22]);
      Assert_Set_EQ (T,  Invalid_Ids ((95, 115), True), [99, 111]);
      Assert_Set_EQ (T,  Invalid_Ids ((998, 1012), True), [999, 1010]);
      Assert_Set_EQ (T,  Invalid_Ids ((1188511880, 1188511890), True), [1188511885]);
      Assert_Set_EQ (T,  Invalid_Ids ((222220, 222224), True), [222222]);
      Assert_Set_EQ (T,  Invalid_Ids ((1698522, 1698528), True), []);
      Assert_Set_EQ (T,  Invalid_Ids ((446443, 446449), True), [446446]);
      Assert_Set_EQ (T,  Invalid_Ids ((38593856, 38593862), True), [38593859]);
      Assert_Set_EQ (T,  Invalid_Ids ((565653, 565659), True), [565656]);
      Assert_Set_EQ (T,  Invalid_Ids ((824824821, 824824827), True), [824824824]);
      Assert_Set_EQ (T,  Invalid_Ids ((2121212118, 2121212124), True), [2121212121]);
   end Test_Invalid_Ids_Extended;

   function All_Tests return Trendy_Test.Test_Group is
   begin
      return
         [
            Test_Example'Access,
            Test_Example_Extended'Access,
            Test_Invalid_Ids'Access,
            Test_Invalid_Ids_Extended'Access
         ];
   end All_Tests;
end Day_2.Tests;

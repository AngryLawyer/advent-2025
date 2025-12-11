with Trendy_Test;
with Trendy_Test.Assertions.Integer_Assertions;
with Trendy_Test.Assertions.Discrete;

use Trendy_Test.Assertions;
use Trendy_Test.Assertions.Integer_Assertions;

with Day_2.Parser;
with Day_2.Product_Ranges;
with Day_2.Numerics;

with Stringly_Asserts;

with Ada.Text_IO; use Ada.Text_IO;

package body Day_2.Tests is
   use Day_2.Product_Ranges;
   use Day_2.Parser;
   use Day_2.Numerics;

   package Long_Integer_Assertions
       is new Trendy_Test.Assertions.Discrete (Long_Integer);

   package Long_Natural_Set_Assertions
      is new Stringly_Asserts (
         Element_Type => Long_Natural_Sets.Set,
         Image => Long_Natural_Sets.Set'Image
      );

   package Positive_Set_Assertions
      is new Stringly_Asserts (
         Element_Type => Positive_Sets.Set,
         Image => Positive_Sets.Set'Image
      );

   package Positive_Vector_Assertions
      is new Stringly_Asserts (
         Element_Type => Positive_Vectors.Vector,
         Image => Positive_Vectors.Vector'Image
      );

   use Long_Integer_Assertions;
   use Long_Natural_Set_Assertions;
   use Positive_Set_Assertions;
   use Positive_Vector_Assertions;

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

   procedure Test_Count_Digits (T : in out Trendy_Test.Operation'Class) is
   begin
      T.Register;
      Assert_EQ (T, Count_Digits (1), 1);
      Assert_EQ (T, Count_Digits (10), 2);
      Assert_EQ (T, Count_Digits (100), 3);
      Assert_EQ (T, Count_Digits (1000), 4);
   end Test_Count_Digits;

   procedure Test_Factors (T : in out Trendy_Test.Operation'Class) is
   begin
      T.Register;
      Assert_EQ (T, Factors (1), [1]);
      Assert_EQ (T, Factors (2), [1, 2]);
      Assert_EQ (T, Factors (3), [1, 3]);
      Assert_EQ (T, Factors (4), [1, 2, 4]);
      Assert_EQ (T, Factors (5), [1, 5]);
      Assert_EQ (T, Factors (6), [1, 2, 3, 6]);
   end Test_Factors;

   procedure Test_Duplicated (T : in out Trendy_Test.Operation'Class) is
   begin
      T.Register;
      Assert_EQ (T, Duplicated (12345678, 4, 2), 12341234);
      Assert_EQ (T, Duplicated (123456789, 3, 3), 123123123);
      Assert_EQ (T, Duplicated (1000, 2, 2), 1010);
   end Test_Duplicated;

   procedure Test_Example (T : in out Trendy_Test.Operation'Class) is
      Ranges : Product_Range_Vectors.Vector;
   begin
      T.Register;
      for R of Range_Array loop
         Ranges.Append (Parse_Range (R));
      end loop;
      Assert_EQ (T, Total_Of_Invalid_Ids (Ranges, False), 1227775554);
   end Test_Example;

   procedure Test_Example_Extended (T : in out Trendy_Test.Operation'Class) is
      Ranges : Product_Range_Vectors.Vector;
   begin
      T.Register;
      for R of Range_Array loop
         Ranges.Append (Parse_Range (R));
      end loop;
      Assert_EQ (T, Total_Of_Invalid_Ids (Ranges, True), 4174379265);
   end Test_Example_Extended;

   procedure Test_Invalid_Ids (T : in out Trendy_Test.Operation'Class) is
   begin
      T.Register;
      Assert_EQ (T,  Invalid_Ids ((11, 22), False), [11, 22]);
      Assert_EQ (T,  Invalid_Ids ((95, 115), False), [99]);
      Assert_EQ (T,  Invalid_Ids ((998, 1012), False), [1010]);
      Assert_EQ (T,  Invalid_Ids ((1188511880, 1188511890), False), [1188511885]);
      Assert_EQ (T,  Invalid_Ids ((222220, 222224), False), [222222]);
      Assert_EQ (T,  Invalid_Ids ((1698522, 1698528), False), []);
      Assert_EQ (T,  Invalid_Ids ((446443, 446449), False), [446446]);
      Assert_EQ (T,  Invalid_Ids ((38593856, 38593862), False), [38593859]);
      Assert_EQ (T,  Invalid_Ids ((565653, 565659), False), []);
      Assert_EQ (T,  Invalid_Ids ((824824821, 824824827), False), []);
      Assert_EQ (T,  Invalid_Ids ((2121212118, 2121212124), False), []);
   end Test_Invalid_Ids;

   procedure Test_Invalid_Ids_Extended (T : in out Trendy_Test.Operation'Class) is
   begin
      T.Register;
      Assert_EQ (T,  Invalid_Ids ((11, 22), True), [11, 22]);
      Assert_EQ (T,  Invalid_Ids ((95, 115), True), [99, 111]);
      Assert_EQ (T,  Invalid_Ids ((998, 1012), True), [999, 1010]);
      Assert_EQ (T,  Invalid_Ids ((1188511880, 1188511890), True), [1188511885]);
      Assert_EQ (T,  Invalid_Ids ((222220, 222224), True), [222222]);
      Assert_EQ (T,  Invalid_Ids ((1698522, 1698528), True), []);
      Assert_EQ (T,  Invalid_Ids ((446443, 446449), True), [446446]);
      Assert_EQ (T,  Invalid_Ids ((38593856, 38593862), True), [38593859]);
      Assert_EQ (T,  Invalid_Ids ((565653, 565659), True), [565656]);
      Assert_EQ (T,  Invalid_Ids ((824824821, 824824827), True), [824824824]);
      Assert_EQ (T,  Invalid_Ids ((2121212118, 2121212124), True), [2121212121]);
   end Test_Invalid_Ids_Extended;

   function All_Tests return Trendy_Test.Test_Group is
   begin
      return
         [
            Test_Count_Digits'Access,
            Test_Factors'Access,
            Test_Duplicated'Access,
            Test_Invalid_Ids'Access,
            Test_Invalid_Ids_Extended'Access,
            Test_Example'Access,
            Test_Example_Extended'Access
         ];
   end All_Tests;
end Day_2.Tests;

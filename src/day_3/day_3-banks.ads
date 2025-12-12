with Ada.Containers.Vectors;
with Ada.Containers.Indefinite_Vectors;

package Day_3.Banks is
   subtype Digit is Natural range 0 .. 9;
   package Digit_Vectors is new Ada.Containers.Vectors (Positive, Digit);
   subtype Bank is Digit_Vectors.Vector;
   package Bank_Vectors is new Ada.Containers.Indefinite_Vectors (Positive, Bank, Digit_Vectors."=");

   function Joltage (B : Bank; Safety_Override : Boolean) return Natural;
   function Total_Joltage (Banks : Bank_Vectors.Vector; Safety_Override : Boolean) return Natural;
end Day_3.Banks;

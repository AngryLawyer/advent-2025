with Trendy_Test.Assertions;

generic
   type Element_Type is private;
   with function Image (T : Element_Type) return String;
package Stringly_Asserts is
   use Trendy_Test.Assertions;

   procedure Assert_EQ (
      T : in out Trendy_Test.Operation'Class;
      Left : Element_Type; Right : Element_Type);
end Stringly_Asserts;

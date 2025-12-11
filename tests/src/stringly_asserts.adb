package body Stringly_Asserts is
   procedure Assert_EQ (
      T : in out Trendy_Test.Operation'Class;
      Left : Element_Type; Right : Element_Type) is
   begin
      Assert_EQ (T, Image (Left), Image (Right));
   end Assert_EQ;
end Stringly_Asserts;

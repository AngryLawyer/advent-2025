package Day_2.Product_Range is
   type Product_Range is record
      Left: Positive;
      Right: Positive;
   end record;

   function Total_Invalid_Ids (R : Product_Range) return Natural;
end Day_2.Product_Range;

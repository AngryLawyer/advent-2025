with Day_3.Banks;

package Day_3.Parser is
   use Day_3.Banks;

   function Parse_Bank (Raw : String) return Bank;
   function Read_Banks (Path : String) return Bank_Vectors.Vector;
end Day_3.Parser;

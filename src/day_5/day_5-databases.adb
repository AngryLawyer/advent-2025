package body Day_5.Databases is
   function Freshness_Count (DB : Database) return Natural is
      Total : Natural := 0;
   begin
      for I of DB.Ingredients loop
         for R of DB.Ranges loop
            if Includes (R, I) then
               Total := Total + 1;
            end if;
         end loop;
      end loop;
      return Total;
   end Freshness_Count;

   function All_Possible_Freshness_Count (DB : Database) return U64 is
      Total : U64 := 0;
   begin
      for R of DB.Ranges loop
         Total := Total + Size (R);
      end loop;
      return Total;
   end All_Possible_Freshness_Count;
end Day_5.Databases;

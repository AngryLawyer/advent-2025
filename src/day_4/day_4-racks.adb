with Ada.Strings.Hash;

package body Day_4.Racks is
   function Is_Accessible (R : Rack; X : Positive; Y : Positive) return Boolean is
      Adjacent_Count : Natural := 0;
      Args_As_Coordinate : constant Coordinate := (X, Y);
      Checked_As_Coordinate : Coordinate;
   begin
      for I in (Natural (X) - 1) .. (Natural (X) + 1) loop
         for J in (Natural (Y) - 1) .. (Natural (Y) + 1) loop
            if I > 0 and then I <= R.Width and then J > 0 and then J <= R.Height then
               Checked_As_Coordinate := (Positive (I), Positive (J));
               if Args_As_Coordinate /= Checked_As_Coordinate and then R.Scrolls.Contains (Checked_As_Coordinate) then
                  Adjacent_Count := Adjacent_Count + 1;
               end if;
            end if;
         end loop;
      end loop;
      return Adjacent_Count < 4;
   end Is_Accessible;

   function Get_Accessible (R : Rack) return Coordinate_Sets.Set is
      Accessible : Coordinate_Sets.Set;
   begin
      for Scroll of R.Scrolls loop
         if Is_Accessible (R, Scroll.X, Scroll.Y) then
            Accessible.Insert ((Scroll.X, Scroll.Y));
         end if;
      end loop;
      return Accessible;
   end Get_Accessible;

   function Total_Accessible (R : Rack) return Natural is
      Accessible : Coordinate_Sets.Set;
   begin
      Accessible := Get_Accessible (R);
      return Integer (Accessible.Length);
   end Total_Accessible;

   function Total_Accessible_With_Removal (R : in out Rack) return Natural is
      Total : Natural := 0;
      Current_Accessible : Coordinate_Sets.Set;
   begin
      Current_Accessible := Get_Accessible (R);
      while Current_Accessible.Length > 0 loop
         Total := Total + Integer (Current_Accessible.Length);
         R.Scrolls := R.Scrolls.Difference (Current_Accessible);
         Current_Accessible := Get_Accessible (R);
      end loop;
      return Total;
   end Total_Accessible_With_Removal;
end Day_4.Racks;

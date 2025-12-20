with Ada.Text_IO; use Ada.Text_IO;
with Ada.Containers; use Ada.Containers;
with Ada.Containers.Hashed_Maps;

package body Day_7.Manifolds is
   function Hash_U64 (Key : Positive) return Hash_Type is
   begin
      return Hash_Type (Key);
   end Hash_U64;

   package U64_Maps is new Ada.Containers.Hashed_Maps (
      Positive,
      U64,
      Hash_U64,
      "="
   );

   procedure Add_To_Map (M : in out U64_Maps.Map; Idx : Positive; Val : U64 := 1) is
      Old_Value : U64 := 0;
   begin
      if M.Contains (Idx) then
         Old_Value := M.Element (Idx);
      end if;
      M.Include (Idx, Old_Value + Val);
   end Add_To_Map;

   function Count_Splits (M : Manifold) return Natural is
      Rays : Natural_Sets.Set;
      Hits : Natural := 0;
   begin
      Rays.Insert (M.Start.X);
      for I in M.Start.Y .. Positive (M.Splitters.Length) loop
         declare
            New_Rays : Natural_Sets.Set;
            Row : constant Natural_Set_Vectors.Constant_Reference_Type := Natural_Set_Vectors.Constant_Reference (M.Splitters, I);
         begin
            for Ray of Rays loop
               if Row.Contains (Ray) then
                  if Ray > 1 then
                     New_Rays.Include (Ray - 1);
                  end if;
                  New_Rays.Include (Ray + 1);
                  Hits := Hits + 1;
               else
                  New_Rays.Include (Ray);
               end if;
            end loop;
            Rays := New_Rays;
         end;
      end loop;
      return Hits;
   end Count_Splits;

   function Count_Timelines (M : Manifold) return U64 is
      Rays : U64_Maps.Map;
      Total : U64 := 0;
   begin
      Rays.Insert (M.Start.X, 1);
      for I in M.Start.Y .. Positive (M.Splitters.Length) loop
         declare
            New_Rays : U64_Maps.Map;
            Row : constant Natural_Set_Vectors.Constant_Reference_Type := Natural_Set_Vectors.Constant_Reference (M.Splitters, I);

            procedure Process_Ray (Position : U64_Maps.Cursor) is
               Ray_Pos : Positive := U64_Maps.Key (Position);
               Ray_Count : U64 := U64_Maps.Element (Position);
            begin
               if Row.Contains (Ray_Pos) then
                  if Ray_Pos > 1 then
                     Add_To_Map (New_Rays, Ray_Pos - 1, Ray_Count);
                  end if;
                  Add_To_Map (New_Rays, Ray_Pos + 1, Ray_Count);
               else
                  Add_To_Map (New_Rays, Ray_Pos, Ray_Count);
               end if;
            end Process_Ray;
         begin
            Rays.Iterate (Process_Ray'access);
            Rays := New_Rays;
         end;
      end loop;
      for C in Rays.Iterate loop
         Total := Total + U64_Maps.Element (C);
      end loop;
      return Total;
   end Count_Timelines;
end Day_7.Manifolds;

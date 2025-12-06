package body Day_1.Safe is
   function Init (Pos : Safe_Position) return Safe is
      Safe_Value : Safe;
   begin
      Safe_Value := (Pos, 0, 0);
      return Safe_Value;
   end Init;

   procedure Apply (S : in out Safe; Action : Day_1.Rotation.Rotation) is
   begin
      S.Passes := S.Passes + (Calculate_Passes (S.Pos, Action));
      case Action.Dir is
         when Day_1.Rotation.Left =>
            S.Pos := S.Pos - Safe_Position'Mod (Action.Amount);

         when Day_1.Rotation.Right =>
            S.Pos := S.Pos + Safe_Position'Mod (Action.Amount);
      end case;

      if S.Pos = 0 then
         S.Exact_Count := S.Exact_Count + 1;
      end if;
   end Apply;

   function Exact_Count (S : Safe) return Integer is
   begin
      return S.Exact_Count;
   end Exact_Count;

   function Position (S : Safe) return Safe_Position is
   begin
      return S.Pos;
   end Position;

   function Pass_Count (S : Safe) return Integer is
   begin
      return S.Passes;
   end Pass_Count;

   function Calculate_Passes
     (P : Safe_Position; Action : Day_1.Rotation.Rotation) return Integer
   is
      use type Day_1.Rotation.Direction;
      Initial : Natural;
      Total   : Natural;
      Result  : Natural;
   begin
      if Action.Dir = Day_1.Rotation.Left then
         Initial := 100 - (Natural (P));
      else
         Initial := Natural (P);
      end if;
      Total := Initial + Action.Amount;
      Result := Total / 100;
      if Action.Dir = Day_1.Rotation.Left and then P = 0 then
         return Result - 1;
      end if;
      return Result;
   end Calculate_Passes;
end Day_1.Safe;

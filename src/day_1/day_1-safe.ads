with Day_1.Rotation;

package Day_1.Safe is
   type Safe_Position is mod 100;
   type Safe is private;

   function Init (Pos : Safe_Position) return Safe;
   procedure Apply (S : in out Safe; Action : Day_1.Rotation.Rotation);
   function Exact_Count (S : Safe) return Integer;
   function Pass_Count (S : Safe) return Integer;
   function Position (S : Safe) return Safe_Position;
   function Calculate_Passes
     (P : Safe_Position; Distance : Natural) return Integer;
private
   type Safe is record
      Pos         : Safe_Position;
      Exact_Count : Integer;
      Passes      : Integer;
   end record;
end Day_1.Safe;

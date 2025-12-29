with Ada.Text_IO; use Ada.Text_IO;

package body Day_8.Circuits is
   use Ada.Containers;

   function "<" (A : Connection; B : Connection) return Boolean is
   begin
      return A.Distance_Squared < B.Distance_Squared;
   end "<";

   function Distance_Squared (A : Coordinate_3D; B : Coordinate_3D) return U64 is
      X : I64;
      Y : I64;
      Z : I64;
   begin
      X := I64 (B.X - A.X);
      Y := I64 (B.Y - A.Y);
      Z := I64 (B.Z - A.Z);
      return U64 (abs ((X * X) + (Y * Y) + (Z * Z)));
   end Distance_Squared;

   function Distances_Squared (C : Circuit) return Ordered_Connections.Set
      with Pre => C.Nodes.Length >= 2
   is
      Set : Ordered_Connections.Set;
   begin
      for I in C.Nodes.First_Index .. (C.Nodes.Last_Index - 1) loop
         for J in I + 1 .. C.Nodes.Last_Index loop
            declare
               A : constant Coordinate_3D := C.Nodes.Element (I);
               B : constant Coordinate_3D := C.Nodes.Element (J);
            begin
               Set.Insert ((
                  Distance_Squared => Distance_Squared (A, B),
                  A => A,
                  B => B
               ));
            end;
         end loop;
      end loop;
      return Set;
   end Distances_Squared;

   procedure Rebucket (Buckets : in out Node_Set_Vectors.Vector; C : Connection) is
      use Node_Set_Vectors;
      use Node_Sets;
      A_Bucket : Node_Set_Vectors.Cursor;
      B_Bucket : Node_Set_Vectors.Cursor;
   begin
      for Bucket_Cursor in Buckets.Iterate loop
         declare
            S : constant Node_Set_Vectors.Reference_Type := Buckets.Reference (Bucket_Cursor);
         begin
            if S.Contains (C.A) then
               A_Bucket := Bucket_Cursor;
            end if;
            if S.Contains (C.B) then
               B_Bucket := Bucket_Cursor;
            end if;
         end;
      end loop;

      if A_Bucket /= Node_Set_Vectors.No_Element and then B_Bucket /= Node_Set_Vectors.No_Element then
         if A_Bucket /= B_Bucket then
            --  Both items exist in buckets and need to be joined
            declare
               New_Bucket : Node_Sets.Set;
            begin
               New_Bucket := Buckets (A_Bucket) or Buckets (B_Bucket);
               Buckets.Delete (A_Bucket);
               Buckets.Delete (B_Bucket);
               Buckets.Append (New_Bucket);
               Put_Line ("JOIN!");
            end;
         else
            Put_Line ("SKIP!");
         end if;
      elsif A_Bucket /= Node_Set_Vectors.No_Element then
         --  Left has a bucket, right doesn't
         Buckets (A_Bucket).Insert (C.B);
         Put_Line ("LEFT BUCKET!");
      elsif B_Bucket /= Node_Set_Vectors.No_Element then
         Buckets (B_Bucket).Insert (C.A);
         Put_Line ("RIGHT BUCKET!");
      else
         --  Neither has a bucket, create a new one and append
         declare
            New_Bucket : constant Node_Sets.Set := [C.A, C.B];
         begin
            Buckets.Append (New_Bucket);
            Put_Line ("NEW BUCKET!");
         end;
      end if;
   end Rebucket;

   function Bucket_Sizes (Buckets : Node_Set_Vectors.Vector) return Natural_Vectors.Vector is
      Sizes : Natural_Vectors.Vector;
   begin
      for B of Buckets loop
         Sizes.Append (Natural (B.Length));
      end loop;
      Natural_Vectors_Reverse_Sorting.Sort (Sizes);
      return Sizes;
   end Bucket_Sizes;

   function Calculate_Three_Largest (C : Circuit; Connections : Positive) return Natural is
      Ordered : Ordered_Connections.Set;
      Buckets : Node_Set_Vectors.Vector;
      Connection_Count : Natural := 0;
   begin
      Ordered := Distances_Squared (C);
      for C of Ordered loop
         if Connection_Count >= Connections then
            exit;
         end if;
         Rebucket (Buckets, C);
         Connection_Count := Connection_Count + 1;
      end loop;
      declare
         Sizes : Natural_Vectors.Vector := Bucket_Sizes (Buckets);
         Bucket_1_Size : Natural := 1;
         Bucket_2_Size : Natural := 1;
         Bucket_3_Size : Natural := 1;
         L : Natural := Natural (Sizes.Length);
      begin
         Put_Line (Sizes'Image);
         if L >= 3 then
            Bucket_3_Size := Sizes (3);
         end if;
         if L >= 2 then
            Bucket_2_Size := Sizes (2);
         end if;
         if L >= 1 then
            Bucket_1_Size := Sizes (1);
         end if;
         return Bucket_1_Size * Bucket_2_Size * Bucket_3_Size;
      end;
   end Calculate_Three_Largest;
end Day_8.Circuits;

with Ada.Containers.Indefinite_Vectors;
with Trendy_Test;

package Day_3.Tests is
   package String_Vectors is new Ada.Containers.Indefinite_Vectors (Positive, String);
   function All_Tests return Trendy_Test.Test_Group;
end Day_3.Tests;

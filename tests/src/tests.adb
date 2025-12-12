with Ada.Text_IO;

with Trendy_Test.Reports;

with Day_1.Tests;
with Day_2.Tests;
with Day_3.Tests;
with Day_4.Tests;

procedure Tests is
begin
   Trendy_Test.Register (Day_1.Tests.All_Tests);
   Trendy_Test.Register (Day_2.Tests.All_Tests);
   Trendy_Test.Register (Day_3.Tests.All_Tests);
   Trendy_Test.Register (Day_4.Tests.All_Tests);
   Trendy_Test.Reports.Print_Basic_Report (Trendy_Test.Run);
end Tests;

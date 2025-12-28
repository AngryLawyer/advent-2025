with Trendy_Test.Reports;

with Ranges.Tests;
with Day_1.Tests;
with Day_2.Tests;
with Day_3.Tests;
with Day_4.Tests;
with Day_5.Tests;
with Day_6.Tests;
with Day_7.Tests;
with Day_8.Tests;
with Day_9.Tests;
with Day_10.Tests;
with Day_11.Tests;
with Day_12.Tests;

procedure Tests is
begin
   Trendy_Test.Register (Ranges.Tests.All_Tests);
   Trendy_Test.Register (Day_1.Tests.All_Tests);
   Trendy_Test.Register (Day_2.Tests.All_Tests);
   Trendy_Test.Register (Day_3.Tests.All_Tests);
   Trendy_Test.Register (Day_4.Tests.All_Tests);
   Trendy_Test.Register (Day_5.Tests.All_Tests);
   Trendy_Test.Register (Day_6.Tests.All_Tests);
   Trendy_Test.Register (Day_7.Tests.All_Tests);
   Trendy_Test.Register (Day_8.Tests.All_Tests);
   Trendy_Test.Register (Day_9.Tests.All_Tests);
   Trendy_Test.Register (Day_10.Tests.All_Tests);
   Trendy_Test.Register (Day_11.Tests.All_Tests);
   Trendy_Test.Register (Day_12.Tests.All_Tests);
   Trendy_Test.Reports.Print_Basic_Report (Trendy_Test.Run);
end Tests;

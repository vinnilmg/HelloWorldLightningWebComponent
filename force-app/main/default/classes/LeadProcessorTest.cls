@isTest
private class LeadProcessorTest {
  @testSetup
  static void setup() {
    List<Lead> leads = new List<Lead>();

    for (Integer i = 0; i < 200; i++) {
      leads.add(
        new Lead(LastName='Teste', Company='Teste')
      );
    }

    insert leads;
  }

  @isTest static void test() {
    Test.startTest();
      LeadProcessor batch = new LeadProcessor();
      Id batchId = Database.executeBatch(batch, 200);
    Test.stopTest();

    System.assertEquals(200, [select count() from Lead LIMIT 200]);
  }
}
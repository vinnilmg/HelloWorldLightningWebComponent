@isTest
private class DailyLeadProcessorTest {

  public static String CRON_EXP = '0 0 0 15 12 ? 2022';

  @testSetup
  static void makeData() {
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
      String jobId = System.schedule('DailyLeadProcessorScheduled', CRON_EXP, new DailyLeadProcessor());
      
      // antes de rodar
      System.assertEquals(0, [SELECT count() from Lead where LeadSource = 'Dreamforce']);
    Test.stopTest();

    System.assertEquals(200, [SELECT count() from Lead where LeadSource = 'Dreamforce']);
  }
}
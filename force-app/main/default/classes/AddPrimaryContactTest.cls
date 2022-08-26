@isTest
private class AddPrimaryContactTest {
  @testSetup
  static void setup() {
    List<Account> contas = new List<Account>();
    
    for (Integer i=0; i < 50; i++) {
      contas.add(
        new Account(Name='Teste' + i, BillingState='NY')
      );
    }

    for (Integer i=0; i < 50; i++) {
      contas.add(
        new Account(Name='Teste' + i, BillingState='CA')
      );
    }

    insert contas;

    Contact contato = new Contact(LastName='Teste');
    insert contato;
  }

  @isTest static void test() {
    Contact contato = [SELECT id FROM Contact where LastName = 'Teste' LIMIT 1];

    AddPrimaryContact job1 = new AddPrimaryContact(contato, 'CA');
    AddPrimaryContact job2 = new AddPrimaryContact(contato, 'NY');

    Test.startTest();
      System.enqueueJob(job1);
      System.enqueueJob(job2);
    Test.stopTest();

    System.assertEquals(50, [select count() from Account where BillingState='CA']);
    System.assertEquals(50, [select count() from Account where BillingState='NY']);
  }

}
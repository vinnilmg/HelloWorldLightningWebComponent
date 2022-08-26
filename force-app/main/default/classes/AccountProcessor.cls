public class AccountProcessor {

  @future
  public static void countContacts(List<Id> accountIds) {
    List<Account> accounts = [Select Number_Of_Contacts__c from Account Where Id IN :accountIds];
    Integer count = 0;

    for (Account account : accounts) {
      count += account.Number_Of_Contacts__c.intValue();
    }

    System.debug('Contagem: ' + count);
  }

}
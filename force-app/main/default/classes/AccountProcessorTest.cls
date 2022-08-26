@IsTest
private class AccountProcessorTest {
    	
    @IsTest
    private static void testCountContacts() {
       List<Id> listIds = new List<Id>();
        
        Account conta = new Account();
        conta.Name = 'teste';
        conta.Number_Of_Contacts__c = 12.0;
        insert conta;
        
        listIds.add(conta.Id);

        Test.startTest();
            AccountProcessor.countContacts(listIds);
        Test.stopTest();
    }
}
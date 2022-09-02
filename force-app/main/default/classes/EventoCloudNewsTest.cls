@isTest
public class EventoCloudNewsTest {
    @isTest static void test1() {
        Cloud_News__e msg = new Cloud_News__e(
            Local__c = 'local',
            Urgente__c = true,
            News_Content__c = 'news'
        );

        Test.startTest();
        Database.SaveResult result = EventBus.publish(msg);
        Test.stopTest();

        System.assertEquals(true, result.isSuccess());

        List<Case> cases = [Select Id from Case];
        System.assertEquals(1, cases.size());
    }
}

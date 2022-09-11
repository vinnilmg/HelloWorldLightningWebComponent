@IsTest
public with sharing class WarehouseSyncScheduleTest {
    public static final String SCH = '0 0 1 * * ?';
    @isTest static void test() {
        Test.setMock(HttpCalloutMock.class, new WarehouseCalloutServiceMock());

        Test.startTest();
            System.schedule('WarehouseSyncScheduleJob1', SCH, new WarehouseSyncSchedule()); 
        Test.stopTest();

        System.assertEquals(1, [select count() from AsyncApexJob where JobType in ('BatchApexWorker', 'ScheduledApex')]);
    }
}

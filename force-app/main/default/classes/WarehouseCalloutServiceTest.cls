@IsTest
public with sharing class WarehouseCalloutServiceTest {
    @IsTest static void test() {
        Test.setMock(HttpCalloutMock.class, new WarehouseCalloutServiceMock());

        Test.startTest();
            System.enqueueJob(new WarehouseCalloutService());
        Test.stopTest();

        System.assertEquals(2, [Select count() from Product2]);
    }
}

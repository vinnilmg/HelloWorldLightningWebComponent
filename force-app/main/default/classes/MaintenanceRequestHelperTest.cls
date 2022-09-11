@isTest
public with sharing class MaintenanceRequestHelperTest {

    @isTest static void testPositivo() {
        Test.startTest();
            criaSolicitacaoManut.criaSolicitacaoPositivo();
        Test.stopTest();

        System.assertEquals(1, [SELECT count() FROM CASE WHERE Status = 'Closed' AND Type IN ('Routine Maintenance', 'Repair') LIMIT 200]);
        //System.assertEquals(2, [SELECT count() FROM CASE]);
    }

    @isTest static void testNegativo() {
        Test.startTest();
            criaSolicitacaoManut.criaSolicitacaoNegativo();
        Test.stopTest();

        System.assertEquals(0, [SELECT count() FROM CASE WHERE Status = 'Closed' AND Type IN ('Routine Maintenance', 'Repair') LIMIT 200]);
        System.assertEquals(1, [SELECT count() FROM CASE]);
    }
}

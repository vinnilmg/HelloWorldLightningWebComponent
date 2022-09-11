public with sharing class criaSolicitacaoManut {
    public static void criaSolicitacaoPositivo() {
            Product2 equipamento1 = new Product2(
                Name = 'Generator 1000 kW',
                Warehouse_SKU__c = '55d66226726b611100aaf741',
                Current_Inventory__c = 5.0,
                Cost__c = 5000,
                Maintenance_Cycle__c = 365,
                Lifespan_Months__c = 120,
                Replacement_Part__c = true
            );

            Product2 equipamento2 = new Product2(
                Name = 'Generator 10 kW',
                Warehouse_SKU__c = '1223123asda',
                Current_Inventory__c = 5.0,
                Cost__c = 5000,
                Maintenance_Cycle__c = 100,
                Lifespan_Months__c = 120,
                Replacement_Part__c = true
            );
    
            insert equipamento1;
            insert equipamento2;
    
            Vehicle__c veiculo = new Vehicle__c(
                Model__c = 'Travel Trailer RV',
                Name = 'Travel Trailer RV',
                Shower__c = false,
                Roof_Mounted_Antenna__c = false
            );
    
            insert veiculo;
    
            Case solicitacao = new Case(
                Type = 'Repair',
                Status = 'Closed',
                Vehicle__c = veiculo.Id,
                Subject = 'Teste'
            );
    
            insert solicitacao;
    
            Equipment_Maintenance_Item__c itemSolicitacao1 = new Equipment_Maintenance_Item__c(
                Equipment__c = equipamento1.Id,
                Quantity__c = 2.0,
                Maintenance_Request__c = solicitacao.Id
            );

            Equipment_Maintenance_Item__c itemSolicitacao2 = new Equipment_Maintenance_Item__c(
                Equipment__c = equipamento2.Id,
                Quantity__c = 2.0,
                Maintenance_Request__c = solicitacao.Id
            );
    
            insert itemSolicitacao1;
            insert itemSolicitacao2;

            update solicitacao;
    }


    public static void criaSolicitacaoNegativo() {
        Vehicle__c veiculo = new Vehicle__c(
            Model__c = 'Travel Trailer RV',
            Name = 'Travel Trailer RV',
            Shower__c = false,
            Roof_Mounted_Antenna__c = false
        );

        insert veiculo;

        Case solicitacao = new Case(
            Type = 'Other',
            Status = 'Closed',
            Vehicle__c = veiculo.Id,
            Subject = 'Teste'
        );

        insert solicitacao;
        update solicitacao;
    }
}

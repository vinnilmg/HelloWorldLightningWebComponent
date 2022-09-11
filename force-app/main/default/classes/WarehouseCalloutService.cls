public with sharing class WarehouseCalloutService implements Queueable, Database.AllowsCallouts {
    private final String ENDPOINT_NAME = 'https://th-superbadge-apex.herokuapp.com/equipment';

    public WarehouseCalloutService() {
    }

    public void execute(QueueableContext qc) {
        System.debug('Iniciando job... ID: ' + qc.getJobId());

        List<Product2> equipamentosOK = new List<Product2>();

        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(ENDPOINT_NAME);
        request.setMethod('GET');
        
        HttpResponse response = http.send(request);
        List<Object> equipamentos = (List<Object>) JSON.deserializeUntyped(response.getBody());
        
        for (Object equip : equipamentos) {
            Map<String, Object> equipMap = (Map<String, Object>) equip;

            Product2 novoEquipamento = new Product2(
                Name = (String) equipMap.get('name'),
                Warehouse_SKU__c = (String) equipMap.get('_id'),
                Replacement_Part__c = true,
                Cost__c = (Decimal) equipMap.get('cost'),
                Current_Inventory__c = (Decimal) equipMap.get('quantity'),
                Lifespan_Months__c = (Decimal) equipMap.get('lifespan'),
                Maintenance_Cycle__c = (Decimal) equipMap.get('maintenanceperiod')
            );

            equipamentosOK.add(novoEquipamento);
        }

        System.debug('Equipamentos para inserir/atualizar: ' + equipamentosOK.size());
        
        if (equipamentosOK.size() > 0) Database.upsert(equipamentosOK, Product2.Warehouse_SKU__c, true);
    }
}

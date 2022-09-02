public with sharing class CriaOrderEvent {
    public CriaOrderEvent() {
    }

    public static void publish(String order, boolean entregue) {
        Order_Event__e evento = new Order_Event__e (
            Order_Number__c = order,
            Has_Shipped__c = entregue
        );

        Database.SaveResult result = EventBus.publish(evento);

        if (result.isSuccess()) {
            System.debug('Id msg:' + result.getId());
        } else {
            for(Database.Error err : result.getErrors()) {
                System.debug('[ERRO] Status:' + err.getStatusCode() + ' - ' + err.getMessage());
            }
        }
    }
}

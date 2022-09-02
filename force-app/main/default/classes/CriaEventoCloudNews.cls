public with sharing class CriaEventoCloudNews {
    public CriaEventoCloudNews() {
    }

    public static void publishMsg(String local, boolean urgente, String news) {
        Cloud_News__e msg = new Cloud_News__e(
            Local__c = local,
            Urgente__c = urgente,
            News_Content__c = news
        );

        Database.SaveResult result = EventBus.publish(msg); 
        System.debug(result);
        if (result.isSuccess()) {
            System.debug('Evento publicado.');
        } else {
            for(Database.Error err : result.getErrors()) {
                System.debug('[ERRO] Status:' + err.getStatusCode() + ' - ' + err.getMessage());
            }
        }
    }
}

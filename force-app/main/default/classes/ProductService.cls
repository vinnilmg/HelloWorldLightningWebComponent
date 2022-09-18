public with sharing class ProductService {
    private static final String OBJECT_NAME = 'Product2';
    public ProductService() {
    }

    @AuraEnabled(cacheable=true)
    public static List<ListView> getListViews() {
        return [SELECT Id, Name, DeveloperName, SObjectType FROM ListView where SObjectType = :OBJECT_NAME];
    }

    @AuraEnabled(cacheable=true)
    public static List<Product2> getProdutosByListView(Id listViewId) {
        return [SELECT Id, Name FROM Product2 WHERE ]
    }
}

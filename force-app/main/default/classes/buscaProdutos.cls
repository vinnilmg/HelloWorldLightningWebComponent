public with sharing class buscaProdutos {
    public buscaProdutos() {
    }

    @AuraEnabled(cacheable=true)
    public static List<Product2> buscaProdutos(String nomeProduto) {
        if (String.isBlank(nomeProduto)) return new List<Product2>();

        String key = '%' + nomeProduto + '%';
        return [SELECT Id, Name from Product2 WHERE Name LIKE :key LIMIT 5]; 
    }
}

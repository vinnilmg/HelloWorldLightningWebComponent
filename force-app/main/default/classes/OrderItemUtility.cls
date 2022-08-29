public with sharing class OrderItemUtility {
    public static void addBonusBouquet(List<Order> ordersFromTrigger) {
        List<Product2> bonusProductList = [SELECT Id, ProductCode FROM Product2 WHERE ProductCode = 'BOT-BB-12'];
        Product2 bonusProduct = new Product2();
        
        if(bonusProductList.size() > 0) {
            bonusProduct = bonusProductList[0];

            List<PricebookEntry> entryList = [SELECT Id, Product2Id FROM PricebookEntry WHERE Product2Id = :bonusProduct.Id];
            PricebookEntry entry = new PricebookEntry();
              
            if(entryList.size() > 0) {
                entry = entryList[0];
            }

            List<OrderItem> newBouquets = new List<OrderItem>();
            for(Order currentOrder : ordersFromTrigger) {
                if(currentOrder.Status == 'Activated') {
                    OrderItem freeBouquet = new OrderItem(
                        OrderId = currentOrder.id, 
                        PricebookEntryId = entry.id,
                        numberOfFlowers__c = 3,
                        description = 'FREE Bouquet',
                        Quantity = 1,
                        colorTheme__c = 'Spectacular Sunset',
                        percentOfOpening__c = 0,
                        UnitPrice = 0.00
                    );

                    newBouquets.add(freeBouquet);
                }
            }

            insert newBouquets;
        }
    }
}

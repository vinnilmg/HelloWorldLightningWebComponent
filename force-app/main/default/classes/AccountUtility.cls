public with sharing class AccountUtility {
    public static void viewAnnualRevenue() {
        List<Account> accountsList = [SELECT Name, AnnualRevenue FROM Account];

        for (Account conta : accountsList) {
            String acctRev = conta.Name + ':' + conta.AnnualRevenue;
            System.debug(acctRev);
        }
    }
}

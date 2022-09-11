public with sharing class OlderAccountsUtility {
    public OlderAccountsUtility() {
    }

    public static void updateOlderAccounts() {
        Account[] contas = [SELECT ID, Description from Account ORDER BY createdDate ASC LIMIT 5];

        for (Account conta : contas) {
            conta.description = 'Heritage Account';
        }

        update contas;
    }
}

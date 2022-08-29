public with sharing class AccountService {
    public Account createAccount( String accountName, String accountNumber, String tickerSymbol ) {
      Account newAcct = new Account(
        Name = accountName,
        First_Name__c = 'Teste',
        Last_Name__c = 'Teste',
        AccountNumber = accountNumber,
        TickerSymbol = tickerSymbol
      );
      return newAcct;
    }
  }
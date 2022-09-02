trigger CloudNewsTrigger on Cloud_News__e (after insert) {
  List<Case> casos = new List<Case>();

  for (Cloud_News__e event : Trigger.New) {
    System.debug('Mensagem: ' + event);

    if(event.Urgente__c) {
      Case cs = new Case();
      cs.Priority = 'High';
      cs.Subject = 'Newwws ' + event.Local__c;
      cs.Description = event.News_Content__c;
      casos.add(cs);
    }
  }

  insert casos;
}
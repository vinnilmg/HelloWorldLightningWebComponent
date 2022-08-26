public class LeadProcessor implements Database.Batchable<sObject>, Database.Stateful {
  public Integer leadsAtualizadas = 0;

  public Database.QueryLocator start(Database.BatchableContext bc) {
    return Database.getQueryLocator('SELECT Id, LeadSource FROM Lead');
  }

  public void execute(Database.BatchableContext bc, List<Lead> leads) {

    List<Lead> leadsAtt = new List<Lead>();
    for(Lead lead : leads) {
      lead.LeadSource = 'Dreamforce';
      leadsAtt.add(lead);
      leadsAtualizadas += 1;
    }

    update leadsAtt;
  }

  public void finish(Database.BatchableContext bc) {
    System.debug('Leads atualizadas: ' + leadsAtualizadas);
  }

}
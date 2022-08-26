public class DailyLeadProcessor implements Schedulable {
  public void execute(SchedulableContext context) {
    List<Lead> leads = [SELECT Id, LeadSource from Lead LIMIT 200];

    for (Lead lead : leads) {
      lead.LeadSource = 'Dreamforce';
    }

    update leads;
  }
}
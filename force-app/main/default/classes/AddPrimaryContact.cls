public class AddPrimaryContact implements Queueable {

  private Contact contato;
  private String estado;

  public AddPrimaryContact(Contact contato, String estado) {
    this.contato = contato;
    this.estado = estado;
  }

  public void execute(QueueableContext context) {
    List<Account> contas = [SELECT Id from Account where BillingState = :estado LIMIT 200];
    List<Contact> contatos = new List<Contact>();

    for (Account conta : contas) {
      Contact novoContato = contato.clone();
      novoContato.AccountId = conta.Id;
      novoContato.LastName = 'Testeeee';
      contatos.add(novoContato);
    }

    insert contatos;
  }
}
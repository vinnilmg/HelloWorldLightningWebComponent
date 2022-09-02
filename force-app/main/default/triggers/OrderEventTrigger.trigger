trigger OrderEventTrigger on Order_Event__e (after insert) {
  List<Task> tarefas = new List<Task>();

  for(Order_Event__e event : Trigger.New) {
    System.debug('Mensagem:' + event);

    if (event.Has_Shipped__c) {
      Task tarefa = new Task();
      tarefa.Priority = 'Normal';
      tarefa.Subject = 'Acompanhar pedido enviado ' + event.Order_Number__c;
      tarefa.OwnerId = event.CreatedById;

      tarefas.add(tarefa);
    }
  }

  insert tarefas;
}
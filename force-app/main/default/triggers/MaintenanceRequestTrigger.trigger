trigger MaintenanceRequestTrigger on Case (after update) {
    MaintenanceRequestHelper.criaSolicitacaoDeManutencao(); 
  }
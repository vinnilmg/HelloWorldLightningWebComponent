public with sharing class MaintenanceRequestHelper {

    public static void criaSolicitacaoDeManutencao() {
        List<Case> novasSolicitacoes = new List<Case>();
        List<Equipment_Maintenance_Item__c> itensNovasSolicitacoes = new List<Equipment_Maintenance_Item__c>();

        List<Case> casosParaManutencao = 
        [SELECT Id, Type, Vehicle__c, Subject, (SELECT Id, Equipment__c, Quantity__c, Equipment__r.Maintenance_Cycle__c from Equipment_Maintenance_Items__r) FROM CASE WHERE ID IN :Trigger.New AND Status = 'Closed' AND Type IN ('Routine Maintenance', 'Repair') LIMIT 200];

        if (casosParaManutencao.size() < 1) return;

        for (Case solicitacao : casosParaManutencao) {
            // Cria a nova solicitação de manutencao
            Case novaSolicitacao = new Case(
                Vehicle__c = solicitacao.Vehicle__c,
                Type = 'Routine Maintenance',
                Subject = String.isBlank(solicitacao.Subject) ? 'Gerada manualmente.' : solicitacao.Subject,
                Date_Reported__c = System.today(),
                ParentId = solicitacao.Id
            );

            Decimal menorCiclo = 0;
            for (Equipment_Maintenance_Item__c item : solicitacao.Equipment_Maintenance_Items__r) {
                // valida regra para preenchimento da data de vencimento
                if (menorCiclo == 0) {
                    menorCiclo = item.Equipment__r.Maintenance_Cycle__c;
                } else {
                    if (item.Equipment__r.Maintenance_Cycle__c < menorCiclo) menorCiclo = item.Equipment__r.Maintenance_Cycle__c;
                } 
                
                // replica itens do pai
                Equipment_Maintenance_Item__c novoItem = new Equipment_Maintenance_Item__c(
                    Equipment__c = item.Equipment__c,
                    Quantity__c = item.Quantity__c,
                    Maintenance_Request__c = solicitacao.Id
                  );

                itensNovasSolicitacoes.add(novoItem);
            }

            novaSolicitacao.Date_Due__c = System.today().addDays(Integer.valueOf(menorCiclo));
            novasSolicitacoes.add(novaSolicitacao);
        }

        Database.insert(novasSolicitacoes);

        // preenche o ID da nova solicitacao nos itens
        for (Case novaSolic : novasSolicitacoes) {
            for (Equipment_Maintenance_Item__c item : itensNovasSolicitacoes) {
                if (item.Maintenance_Request__c == novaSolic.ParentId) {
                    item.Maintenance_Request__c = novaSolic.Id;
                }
            }
        }
        
        Database.insert(itensNovasSolicitacoes);
    }
}

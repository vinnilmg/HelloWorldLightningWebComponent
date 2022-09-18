import { publish, MessageContext } from 'lightning/messageService';
import BEAR_LIST_UPDATE_MESSAGE from '@salesforce/messageChannel/BearListUpdate__c';
import { NavigationMixin } from 'lightning/navigation';
import { LightningElement, wire } from 'lwc';
import searchBears from '@salesforce/apex/BearController.searchBears';

export default class BearListWired extends NavigationMixin(LightningElement) {
  searchTerm = '';
  bears;
  @wire(MessageContext) messageContext;
  @wire(searchBears, {searchTerm: '$searchTerm'}) 
  loadBears(result) {
    this.bears = result;
    if (result.data) {
      const message = {
        bears: result.data
      };
      publish(this.messageContext, BEAR_LIST_UPDATE_MESSAGE, message)
    }
  }

  handleSearchTermChange(event) {
    // delay de tempo para nao chamar o apex cada letra que o usuário digitar
		window.clearTimeout(this.delayTimeout);
		const searchTerm = event.target.value;
		// eslint-disable-next-line @lwc/lwc/no-async-operation
		this.delayTimeout = setTimeout(() => {
			this.searchTerm = searchTerm;
		}, 300);
  }

  handleBearView(event) {
    const bearId = event.detail; // pega do evento

    // direciona para a pagina de registro padrao
    this[NavigationMixin.Navigate]({
      type: 'standard__recordPage',
      attributes: {
        recordId: bearId,
        objectApiName: 'Bear__c',
        actionName: 'view',
      }
    });
  }

  // retorna true ou false
  get hasResults() {
    return (this.bears.data.length > 0);
  }
}
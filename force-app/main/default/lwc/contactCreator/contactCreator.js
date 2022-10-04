import { LightningElement } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import CONTACT_OBJECT from '@salesforce/schema/Contact';
import FIRSTNAME_FIELD from '@salesforce/schema/Contact.FirstName';
import LASTNAME_FIELD from '@salesforce/schema/Contact.LastName';
import EMAIL_FIELD from '@salesforce/schema/Contact.Email';

export default class ContactCreator extends LightningElement {
  objectApiName = CONTACT_OBJECT;
  fields = [ FIRSTNAME_FIELD, LASTNAME_FIELD, EMAIL_FIELD ];

  handleSuccess(event) {
    console.log('Evento:', event.detail.id);
    const msgEvent = new ShowToastEvent({
      title: 'Contato criado!',
      message: 'Id do registro criado: ' + event.detail.id,
      variant: 'success',
    });

    this.dispatchEvent(msgEvent);
  }
}
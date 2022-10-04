import { LightningElement, wire } from 'lwc';
import { reduceErrors } from 'c/ldsUtils';
import FIRSTNAME_FIELD from '@salesforce/schema/Contact.FirstName';
import LASTNAME_FIELD from '@salesforce/schema/Contact.LastName';
import EMAIL_FIELD from '@salesforce/schema/Contact.Email';
import getContacts from '@salesforce/apex/ContactController.getContacts';

const COLUMNS = [
  { label: 'Primeiro Nome', fieldName: FIRSTNAME_FIELD.fieldApiName, type: 'text' },
  { label: 'Último Nome', fieldName: LASTNAME_FIELD.fieldApiName, type: 'text' },
  { label: 'Email', fieldName: EMAIL_FIELD.fieldApiName, type: 'email' },
];

export default class ContactList extends LightningElement {
  columns = COLUMNS;

  @wire(getContacts) 
  contatos;

  get errors () {
    console.log('ERRO:', this.contatos.error);
    return (this.contatos.error) ? reduceErrors(this.contatos.error) : [];  
  }
}
import { LightningElement } from 'lwc';

export default class ParentComponent extends LightningElement {
  page = 1;

  handleNext() {
    console.log('escutei!');
    this.page = this.page + 1;
    console.log('PAGINA: ', this.page);
  }
}
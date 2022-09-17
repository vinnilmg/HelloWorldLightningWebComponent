import { LightningElement } from 'lwc';

export default class ChildComponent extends LightningElement {
  nextHandler() {
    console.log('Evento disparando!');
    this.dispatchEvent(new CustomEvent('next'));
  }

}
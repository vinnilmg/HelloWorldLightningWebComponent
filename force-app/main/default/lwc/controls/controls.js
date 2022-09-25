import { LightningElement } from 'lwc';

export default class Controls extends LightningElement {
  factors = [2, 3, 4, 5, 6];

  handleAdd() {
    this.dispatchEvent(new CustomEvent('add'));
  }

  handleSubtract() {
    this.dispatchEvent(new CustomEvent('subtract'));
  }

  handleMultiply(event) {
    console.log('Evento recebido no controls: ', event.detail);
    this.dispatchEvent(new CustomEvent('multiply', {
      detail: event.detail
    }));
  }

  handleDivision(event) {
    this.dispatchEvent(new CustomEvent('division', {
      detail: event.detail
    }));
  }
  
}
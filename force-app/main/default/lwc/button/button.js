import { LightningElement, api } from 'lwc';

export default class Button extends LightningElement {
  @api label;
  @api icon;
  
  handleButton(event) {
    const factor = event.target.dataset.factor;
    console.log('Factor:', factor);

    this.dispatchEvent(new CustomEvent('buttonclick', {
      bubbles: true, // para permitir que borbulhe
      detail: factor
    }));
  }

}
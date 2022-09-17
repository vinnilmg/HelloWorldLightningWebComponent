import { LightningElement } from "lwc";

export default class Bike extends LightningElement {
  name = 'Electra X4';
  description = 'A sweet bike built for comfort.';
  category = 'Mountain';
  material = 'Steel';
  price = '$2,700';
  pictureUrl = 'https://s3-us-west-1.amazonaws.com/sfdc-demo/ebikes/electrax4.jpg';
  ready = false;
  color = 'Red';

  pessoa = {
    nome: 'teste',
    idade: '20',
  };

  connectedCallback() {
    setTimeout(() => {
      this.ready = true;
    }, 2000);
  };
}

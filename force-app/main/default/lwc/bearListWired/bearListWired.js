import { LightningElement } from 'lwc';
import ursusResource from '@salesforce/resourceUrl/ursus_park'; // static resource
import getAllBears from '@salesforce/apex/BearController.getAllBears'; // método apex

export default class BearList extends LightningElement {
  bears;
  error;
  appResources = {
    bearSilhouette: `${ursusResource}/standing-bear-silhouette.png`, // pegando imagem
  };

  // método executa após carregar o componente
  connectedCallback() {
    this.loadBears();
  }

  loadBears() {
    // chama metodo apex que busca os ursos
    getAllBears()
      .then(result => {
        console.log('Ursos:', result);
        this.bears = result;
      })
      .catch(err => {
        console.log('Erro:', err);
        this.error = err;
      })
  }

}
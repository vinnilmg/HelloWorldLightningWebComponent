import { LightningElement, api } from 'lwc';
import ursusResource from '@salesforce/resourceUrl/ursus_park';

export default class BearTile extends LightningElement {
  @api bear;
  appResources = {
    bearSilhouette: `${ursusResource}/standing-bear-silhouette.png`,
  };

  handleOpenRecordClick() {
    // cria evento
    const newEvent = new CustomEvent('bearview', {
      detail: this.bear.Id,
    });
    // dispara evento
    this.dispatchEvent(newEvent);
  }
}
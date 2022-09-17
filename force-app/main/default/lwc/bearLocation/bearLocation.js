import { LightningElement, api, wire } from 'lwc';
import {getRecord, getFieldValue} from 'lightning/uiRecordApi';

// campos que vou pegar do objeto
const NAME_BEAR = 'Bear__c.Name';
const LOCATION_LATITUDE = 'Bear__c.Location__Latitude__s';
const LOCATION_LONGITUDE = 'Bear__c.Location__Longitude__s';
const bearFields = [
  NAME_BEAR,
  LOCATION_LATITUDE,
  LOCATION_LONGITUDE
];

export default class BearLocation extends LightningElement {
  @api recordId; // pega o Id do registro
  name;
  mapMarkers = [];

  @wire(getRecord, { recordId: '$recordId', fields: bearFields }) // ID do registro e lista de campos que quero pegar
  loadBear({error, data}) {
    console.log('Erro:', error);
    console.log('Dados:', data);
    console.log('Id:', this.recordId);

    if (error || !data) return;

    this.name = getFieldValue(data, NAME_BEAR); // pega campo nome
    const Latitude = getFieldValue(data, LOCATION_LATITUDE);
    const Longitude = getFieldValue(data, LOCATION_LONGITUDE);
    console.log(this.name, Latitude, Longitude);

    this.mapMarkers = [{
      location: {Latitude, Longitude},
      title: this.name,
      description: `Coordenadas: ${Latitude}, ${Longitude}`
    }];

  }

  get cardTitle() {
    return (this.name) ? `Localização de ${this.name}` : 'Localização do urso'
  }
}
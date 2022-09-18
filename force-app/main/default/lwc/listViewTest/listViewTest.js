import { LightningElement, wire } from 'lwc';
import getListViews from '@salesforce/apex/ProductService.getListViews';
import {getListUi} from 'lightning/uiListApi';

export default class ListViewTest extends LightningElement {
  value = '00B1U000003uGQ7UAM';
  produtos = [];

  @wire(getListViews) listsViews;

  @wire(getListUi, {
    objectApiName: 'Product2',
    listViewApiName: '$value',
  }) wiredListView(result) {
    if (result.data) {
      this.produtos = result.data.records.records;
      console.log(this.produtos);

    } else if (result.error) {
      console.log(result.error);
    }
  }

  handleChange(event) {
    this.value = event.target.value;
  }

  get options() {
    return this.listsViews.data.map((opcao) => {
      return { label: opcao.Name, value: opcao.DeveloperName }
    });
  }

}
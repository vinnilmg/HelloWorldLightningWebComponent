import { LightningElement } from 'lwc';
import buscaProdutos from '@salesforce/apex/buscaProdutos.buscaProdutos';

export default class JsExample extends LightningElement {
  nomeProduto = '';
  produtos;

  handleClick(e) {
    this.nomeProduto = this.template.querySelector(".nomeProduto").value;
    console.log("produto:", this.nomeProduto);

    buscaProdutos({nomeProduto: this.nomeProduto})
    .then(result => {
      console.log('Produtos:', result);
      this.produtos = result;
    })
    .catch(err => {
      console.log('Erro!', err);
    });
  }

}
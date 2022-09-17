import { LightningElement } from 'lwc';

export default class HelloWebComponent extends LightningElement {
  greeting = '';
  currentDate = new Date().toDateString();

  handleGreetingChange(e) {
    this.greeting = e.target.value;
  }

  get capitalizedGreeting() {
    return `Hello ${this.greeting.toUpperCase()}`
  }

}
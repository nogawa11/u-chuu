import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "button", "form" ]

  connect() {
    console.log("show controller connected");
  }

  showForm() {
    this.formTarget.classList.toggle("show")
  }
}

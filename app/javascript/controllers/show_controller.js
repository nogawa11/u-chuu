import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "button", "formContainer", "createReviewButton", "content" ]

  connect() {
    console.log("show controller connected");
    console.log(this.contentTarget);
  }

  showForm() {
    this.formContainerTarget.classList.toggle("show")
  }

  isContentEmpty(e) {
    this.createReviewButtonTarget.disabled = !this.contentTarget.value;
  }
}

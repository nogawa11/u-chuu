import { Controller } from "@hotwired/stimulus"
import { csrfToken } from "@rails/ujs"

export default class extends Controller {
  static targets = ["items", "form"]

  send(event) {
    event.preventDefault()

    fetch(this.formTarget.action, {
      method: this.formTarget.method,
      headers: { Accept: 'application/json', "X-CSRF-Token": csrfToken() },
      body: new FormData(this.formTarget)
    })
    .then(response => response.json())
    .then(data => {
      if (data.inserted_item) this.itemsTarget.insertAdjacentHTML('afterbegin', data.inserted_item)
      this.formTarget.outerHTML = data.form
    })
  }
}

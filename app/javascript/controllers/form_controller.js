import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "nights", "pricePerNight", "price", "total", "startDateInput", "endDateInput", "numberOfGuestsInput" ]

  connect() {
    const today = new Date();
    const tomorrow = new Date(today);
    tomorrow.setDate(tomorrow.getDate() + 1);

    this.startDateInputTarget.value = today.toISOString().split('T')[0];
    this.endDateInputTarget.value = tomorrow.toISOString().split('T')[0];
    this.numberOfGuestsInputTarget.value = 1;
    this.pricePerNight = parseInt(this.pricePerNightTarget.innerHTML.replace(/\D/g, "")) / 100
    this.startDate = this.startDateInputTarget.value
    this.endDate = this.endDateInputTarget.value || this.startDateInputTarget.value
    this.numberOfGuests = parseInt(this.numberOfGuestsInputTarget.value)
    this.nights = this.endDate - this.startDate
    this.price = this.priceTarget
    this.total = this.pricePerNight * this.nights
  }

  getNights() {
    this.nights = this.endDate - this.startDate
  }

  updateStartDate(e) {
    this.startDate = e.target.value;
    this.setPrice(e)
  }

  updateEndDate(e) {
    this.endDate = e.target.value
    this.setPrice(e)
  }

  updateNumberOfGuests(e) {
    this.numberOfGuests = e.target.value
    this.setPrice(e)
  }

  setPrice(e) {
    this.nightsTarget.innerText = (this.#getDateDifference(e));
    let price = parseInt(this.nightsTarget.innerText) * this.pricePerNight;
    this.priceTarget.innerText = this.#getFormattedPrice(price);
    this.totalTarget.innerText = this.#getFormattedPrice(price * this.numberOfGuests + 999);
  }

  /* ----------------------------- Private methods ---------------------------- */
  #getDateDifference(e) {
    const endDate = this.endDateInputTarget.value
    const startDate = this.startDateInputTarget.value
    const difference = Math.abs(new Date(endDate) - new Date(startDate))
    return Math.ceil(difference / (1000 * 60 * 60 * 24))
  }

  #getFormattedPrice(price) {
    return price.toLocaleString('en-US', {
      style: 'currency',
      currency: 'USD'
    })
  }

}

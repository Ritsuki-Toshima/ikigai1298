import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="datepicker"
export default class extends Controller {
  connect() {
    console.log(this);
    flatpickr(this.datePickerTarget, { minDate: "today" })
    // flatpickr(".anotherSelector");
  }
}

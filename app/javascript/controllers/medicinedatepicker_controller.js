
import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";

export default class extends Controller {
  static targets = ["datePickerStart", "datePickerEnd"];


  connect() {
    console.log(this);
    flatpickr(this.datePickerStartTarget, { minDate: "today"})
    flatpickr(this.datePickerEndTarget, { minDate: "today"})


    // flatpickr(".anotherSelector");
  }


}

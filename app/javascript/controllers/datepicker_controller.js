// import { Controller } from "@hotwired/stimulus"

// // Connects to data-controller="datepicker"
// export default class extends Controller {
//   connect() {
//     console.log(this);
//     flatpickr(this.datePickerTarget, { minDate: "today" })
//     // flatpickr(".anotherSelector");
//   }
// }

import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";

export default class extends Controller {
  static targets = ["datePickerStart", "datePickerEnd"];


  connect() {
    console.log(this);
    flatpickr(this.datePickerStartTarget, {minDate: "today"})
    flatpickr(this.datePickerEndTarget, {minDate: "today"})

    // flatpickr(".anotherSelector");
  }


}

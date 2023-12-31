import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="appointments"
export default class extends Controller {
  connect() {
console.log("HELLO")
  const appointmentIcons = document.querySelectorAll('.appointment-icon');

  appointmentIcons.forEach(icon => {
icon.addEventListener('click', function () {
  const appointmentId = this.dataset.appointmentId;
  const appointmentDetails = document.querySelector(`.appointment-details[data-appointment-id="${appointmentId}"]`);

  if (appointmentDetails) {
    if (appointmentDetails.style.display === 'none' || appointmentDetails.style.display === '') {
      document.querySelectorAll('.appointment-details').forEach(details => {
        details.style.display = 'none';
      });
      appointmentDetails.style.display = 'block';
    } else {
      appointmentDetails.style.display = 'none';
    }
  }
});
});


  }
}

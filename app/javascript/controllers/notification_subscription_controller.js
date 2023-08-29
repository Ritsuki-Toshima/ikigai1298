import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

// Connects to data-controller="notification-subscription"
export default class extends Controller {
  static targets = ["notifications"]
  connect() {
    createConsumer().subscriptions.create("NotificationChannel")
  }
}



// export default class extends Controller {
//   static values = { chatroomId: Number }


//   connect() {
//     console.log(`Subscribe to the chatroom with the id ${this.chatroomIdValue}.`)
//   }
// }

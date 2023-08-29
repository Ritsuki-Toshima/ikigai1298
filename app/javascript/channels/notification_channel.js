import CableReady from "cable_ready";
import { createConsumer } from "@rails/actioncable";

createConsumer().subscriptions.create("NotificationChannel", {
  connected() {
    console.log("Connected to channel");
  },

  disconnected() {

  },


  received(data) {
    console.log(data);
    const el = document.getElementById("notification")
    el.insertAdjacentHTML("afterBegin",
      `<div class="alert alert-info alert-dismissible fade show m-1" role="alert">
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        <p>Hello Alvin: ${data.body}</p>
      </div>`
    )
    // Notification.new(data.title, { body: data.body })
  },
});

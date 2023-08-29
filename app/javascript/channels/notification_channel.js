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
    new Notification(data.title, { body: data.body })
  },
});

import CableReady from "cable_ready";
import { createConsumer } from "@rails/actioncable";

createConsumer().subscriptions.create("NotificationChannel", {
  connected() {
    console.log("What do I do now?");
  },

  disconnected() {

  },

  received(data) {
    if (data.cableReady) CableReady.perform(data.operations);
  },
});

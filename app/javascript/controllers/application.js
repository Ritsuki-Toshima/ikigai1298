import { Application } from "@hotwired/stimulus"
import UnitSyncController from "../controllers/unit_sync_controller";

const application = Application.start()
application.register("unit-sync", UnitSyncController);

// Configure Stimulus development experience
application.debug = false
window.Stimulus = application

export { application }

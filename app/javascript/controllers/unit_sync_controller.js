import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="unit-sync"
export default class extends Controller {
  static targets = ["unit", "unitAlt"];

  connect() {
    this.syncUnits();
  }

  syncUnits() {
    this.unitTarget.value = this.unitAltTarget.value;
    this.unitAltTarget.value = this.unitTarget.value;
  }

  onUnitChange() {
    this.syncUnits();
  }

  onUnitAltChange() {
    this.syncUnits();
  }
}

import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="join-organisation"
export default class extends Controller {

  static targets = ["belongs", "does-not-belong"]

  connect() {
    console.log("Connected to join-organisation controller")
  }

  join(event) {
    console.log(event.target)
      this.belongsTarget.classList.remove("d-none")

      this.professionalTarget.classList.remove("d-none")

  }
}

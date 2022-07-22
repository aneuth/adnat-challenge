import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="new-shift"
export default class extends Controller {

  static targets = ["form"]

  connect() {
    console.log("You are connected to new-shift controller")
  }

  revealContent(event) {
    event.preventDefault()
    this.formTarget.classList.remove("d-none")
  }

  closeContent(event) {
    this.formTarget.classList.add("d-none")
  }

}

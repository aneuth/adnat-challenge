import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="new-shift"
export default class extends Controller {

  static targets = ["form", "button"]

  connect() {
    console.log("You are connected to new-shift controller")
  }

  revealContent(event) {
    event.preventDefault()
    this.formTarget.classList.remove("d-none")
    this.buttonTarget.classList.add("d-none")
  }

  closeContent(event) {
    this.formTarget.classList.add("d-none")
    this.buttonTarget.classList.remove("d-none")
  }

}

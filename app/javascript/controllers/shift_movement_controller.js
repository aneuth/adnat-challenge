import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="shift-movement"
export default class extends Controller {
  connect() {
    console.log("You are conected to shift movement controller")
  }
}

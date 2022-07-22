import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="shifts"
export default class extends Controller {
  connect() {
    console.log("You are conected to shifts controller")
  }
}

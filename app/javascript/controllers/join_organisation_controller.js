import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="join-organisation"
export default class extends Controller {

  static targets = ["belongs", "does-not-belong"]
  static values = { organisationId: Number }

  connect() {
    console.log("Connected to join-organisation controller")
  }

  join(event) {
    event.preventDefault;
    console.log(event.target)
   console.log(this.organisationIdValue)
    console.log(event.target.dataset)
    fetch(`/organisations/${event.target.id}/join_organisation`, {method: "POST", headers: {"X-CSRF-Token": this.getMetaValue("csrf-token"), "Accept": "text/plain"}})
    .then(response => response.text())
    .then((data) => {
      console.log(data)
    })

  }

  getMetaValue = (name) => {
    const element = document.head.querySelector(`meta[name="${name}"]`)
    return element.getAttribute("content")
  }
}

import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="join-organisation"
export default class extends Controller {

  static targets = ["belongs", "does-not-belong"]

  connect() {
    console.log("Connected to join-organisation controller")
  }

  join(event) {
    console.log(event.target)
    fetch(`/organisations/${event.target.id}/join_organisation`, {method: "POST", headers: {"X-CSRF-Token": this.getMetaValue("csrf-token")}})
    .then(response => response.text())
    .then((data)
    )

  }

  getMetaValue = (name) => {
    const element = document.head.querySelector(`meta[name="${name}"]`)
    return element.getAttribute("content")
  }
}

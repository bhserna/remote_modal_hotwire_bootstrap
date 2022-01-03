import { Controller } from "@hotwired/stimulus"
import { Modal } from "bootstrap"

export default class extends Controller {
  connect() {
    this.modal = new Modal(this.element)
    this.modal.show()
  }

  disconnect() {
    this.modal.hide()
  }

  hideBeforeRender(event) {
    event.preventDefault()

    this.element.addEventListener('hidden.bs.modal', () => {
      event.detail.resume()
    })

    this.modal.hide()
  }
}

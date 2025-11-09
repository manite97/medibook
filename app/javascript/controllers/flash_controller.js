import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    // auto dismiss after 4s
    this.dismissTimeout = setTimeout(() => this.close(), 8000)
  }

  close() {
    clearTimeout(this.dismissTimeout)
    this.element.classList.add('flash--hide')
    // remove element after transition
    setTimeout(() => {
      try { this.element.remove() } catch(e) {}
    }, 5000)
  }

  disconnect() {
    clearTimeout(this.dismissTimeout)
  }
}

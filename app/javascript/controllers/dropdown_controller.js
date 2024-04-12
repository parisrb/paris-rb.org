import { Controller } from '@hotwired/stimulus'
import { useClickOutside } from 'stimulus-use'

export default class extends Controller {
  static targets = ['summary', 'swap']

  connect () {
    useClickOutside(this)
    this.element.addEventListener('toggle', this.#toggle.bind(this))
  }

  disconnect () {
    this.close()
    this.element.removeEventListener('toggle', this.#toggle)
  }

  clickOutside (event) {
    this.close(event)
  }

  close (event) {
    this.element.open = false
  }

  // Private

  #toggle (event) {
    if (this.element.open) {
      this.hasSwapTarget && this.swapTarget.classList.add('swap-active')
    } else {
      this.hasSwapTarget && this.swapTarget.classList.remove('swap-active')
    }
  }
}

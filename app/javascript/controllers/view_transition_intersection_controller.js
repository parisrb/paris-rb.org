import { Controller } from '@hotwired/stimulus'
import { useIntersection } from 'stimulus-use'

// Connects to data-controller="view-transition-intersection"
//
// Somethime we need to transition element only if they are within the view port
// This controller is used to the view transition name to the element when it is visible only
// <%= image_tag video.thumbnail_url, data: { controller: "view-transition-intersection", view_transition_intersection_name_value: dom_id(video, :preview) } %>
export default class extends Controller {
  static values = { name: String }

  initialize () {
    useIntersection(this)
  }

  appear () {
    this.element.style.cssText += this.transitionStyleValue
  }

  disappear () {
    this.element.style.cssText = this.element.style.cssText.replace(
      this.transitionStyleValue,
      ''
    )
  }

  private

  get transitionStyleValue () {
    return `view-transition-name: ${this.nameValue};`
  }
}

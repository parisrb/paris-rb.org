import "@hotwired/turbo-rails";
import "./controllers";

// add the ability to debounce events in the html attributes debounced:keyup->form#submit
import debounced from "debounced";
debounced.initialize();

// apply view transition on turbo frame
addEventListener("turbo:before-frame-render", (event) => {
  if (document.startViewTransition) {
    const originalRender = event.detail.render;
    event.detail.render = (currentElement, newElement) => {
      document.startViewTransition(() =>
        originalRender(currentElement, newElement)
      );
    };
  }
});

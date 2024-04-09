import "@hotwired/turbo-rails";
import "./controllers";
import "lite-youtube-embed";

// add the ability to debounce events in the html attributes debounced:keyup->form#submit
import debounced from "debounced";
debounced.initialize(debounced.defaultEventNames, { wait: 100 });

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

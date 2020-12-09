import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["card"];
  static values = { url: String };

  show() {
    if (this.hasCardTarget) {
      this.cardTarget.hidden = false;
    } else {
      fetch(this.urlValue)
        .then((r) => r.text())
        .then((html) => {
          const fragment = document
            .createRange()
            .createContextualFragment(html);

          this.element.appendChild(fragment);
        });
    }
  }

  hide() {
    if (this.hasCardTarget) {
      this.cardTarget.hidden = true;
    }
  }

  disconnect() {
    if (this.hasCardTarget) {
      this.cardTarget.remove();
    }
  }
}

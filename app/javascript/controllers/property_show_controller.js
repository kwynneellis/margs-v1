import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["text"]

  readMoreLess() {
    let text = this.textTarget.innerText
    if (text == "Read more...") {
      this.textTarget.innerText = "Read less";
    } else {
      this.textTarget.innerText = "Read more...";
    }
  }
}

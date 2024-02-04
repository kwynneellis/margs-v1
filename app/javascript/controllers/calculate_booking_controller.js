import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["check_in", "check_out", "price", "info", "total"];
  static values = { 
    price: Number, 
    cleaningFee: Number 
  };

  update() {
    console.log("update")
    const pricePerDay = parseInt(this.priceValue, 10);
    const cleaningFee = parseInt(this.cleaningFeeValue, 10);
    // make sure the user has chosen a check in and check out
    if (
      this.check_inTarget.value !== "" &&
      this.check_outTarget.value !== ""
    ) {
      // calculating the time from the values in the HTML
      const diffInMs =
        new Date(this.check_outTarget.value) -
        new Date(this.check_inTarget.value);
      const diffInDays = diffInMs / (1000 * 60 * 60 * 24);
      if (diffInDays > 1) {
        // displays the total price per night
        this.infoTarget.innerText = `£${pricePerDay} x ${diffInDays} nights`;

        this.priceTarget.innerHTML = `<span>£${(
          diffInDays * pricePerDay
        ).toLocaleString()}</span>`;

        this.totalTarget.innerHTML = `<span>£${(
          (diffInDays * pricePerDay) + cleaningFee
        ).toLocaleString()}</span>`;

      } else if (diffInDays === 0 && diffInDays < 2) {
        // displays 2-night minimum if check out is same as check in
        this.infoTarget.innerText = "";
        this.totalTarget.innerText = "";
        this.priceTarget.innerHTML =
          "<span class='text-danger fw-light'>2-night mininum</span>";
      } else {
        // displays invalid if the check out is before the check in or not overnight
        this.infoTarget.innerText = "";
        this.totalTarget.innerText = "";
        this.priceTarget.innerHTML =
          "<span class='text-danger fw-light'>Invalid dates</span>";
      }
    }
  }
}
import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="debounced"
export default class extends Controller {
    static targets = ["field", "form"]

    connect() {
        console.log("starting debounced controller");
    }

    submitForm() {
        clearTimeout(this.timeOut)

        this.timeOut = setTimeout(() => {
            this.formTarget.requestSubmit()
        }, 1000)
    }

    submitFormNow() {
        this.formTarget.requestSubmit()
    }
}

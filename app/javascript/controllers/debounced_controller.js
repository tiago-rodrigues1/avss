import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="debounced"
export default class extends Controller {
    static targets = ["field", "form"]

    connect() {
        console.log("starting debounced controller");
    }

    increment() {
        this.fieldTarget.value = parseInt(this.fieldTarget.value, 10) + 1;
        this.submitForm()
    }

    decrement() {
        let old_value = parseInt(this.fieldTarget.value, 10);

        if (old_value > 1) {
            this.fieldTarget.value = old_value - 1;
        }

        this.submitForm()
    }

    submitForm() {
        console.log("form");
        clearTimeout(this.timeOut)

        this.timeOut = setTimeout(() => {
            this.formTarget.requestSubmit()
        }, 1000)
    }
}

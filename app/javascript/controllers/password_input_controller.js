import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = [ "showpass" ];
    
    showPassword() {
        let isChecked = this.showpassTarget.checked;
        let passwordInputs = document.querySelectorAll(this.showpassTarget.dataset.inputTarget);

        passwordInputs.forEach((input) => {
            if (isChecked) {
                input.type = "text";
            } else {
                input.type = "password";
            }
        });
    }
}
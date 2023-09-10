import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = [ "showpass" ];
    
    showPassword() {
        let isChecked = this.showpassTarget.checked;
        let passwordInput = document.querySelector(this.showpassTarget.dataset.inputTarget);

        if (isChecked) {
            passwordInput.type = "text";
        } else {
            passwordInput.type = "password";
        }
    }
}
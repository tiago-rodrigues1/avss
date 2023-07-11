import { Controller } from '@hotwired/stimulus';

export default class extends Controller {
    expand() {
        const navbarItems = document.querySelector('.navbar--mobile__items');

        navbarItems.classList.toggle('expanded');
        
        if (navbarItems.matches('.expanded')) {
            document.getElementById('btn-close').style.display = 'initial';
            document.getElementById('btn-expand').style.display = 'none';
        } else {
            document.getElementById('btn-close').style.display = 'none';
            document.getElementById('btn-expand').style.display = 'initial';
        }
    }
}
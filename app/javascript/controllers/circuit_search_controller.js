import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="circuit-search"
export default class extends Controller {
	static targets = ['searchInput', 'filterBtn'];

	connect() {
		console.log('connecting to data-controller="circuit-search');
	}

	handleFilterFormSubmit() {
		const filterFormSelector = this.searchInputTarget.dataset.filterFormTarget;
		const filterForm = document.querySelector(filterFormSelector);
		clearTimeout(this.timeOut);

        this.timeOut = setTimeout(() => {
			filterForm.requestSubmit();
        }, 300);
	}

	handleFiltersButton() {
		const filterBtn = this.filterBtnTarget;
		const optionsElementSelector = filterBtn.dataset.optsSelector;
		const optionsElement = document.querySelector(optionsElementSelector);

		optionsElement.hidden = !optionsElement.hidden;	
	}
}

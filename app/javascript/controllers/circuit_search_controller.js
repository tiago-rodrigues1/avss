import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="circuit-search"
export default class extends Controller {
	static targets = ['searchInput', 'searchButton'];
	connect() {
		console.log('connecting to data-controller="circuit-search');
	}

	greet() {
		const element = this.searchInputTarget;
		const term = element.value;

		const button = this.searchButtonTarget;
		button.click();
	}
}

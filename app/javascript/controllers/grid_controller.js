import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  
	connect() {
    var grid = Macy({
			container: this.element,
			trueOrder: false,
			waitForImages: false,
			margin: 0,
			columns: 4,
			breakAt: {
					1200: 5,
					940: 3,
					520: 2,
					400: 1
			}
		});
  }
	
}
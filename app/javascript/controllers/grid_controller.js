import { Controller } from "@hotwired/stimulus"
import "imagesLoaded"
import "masonry"

export default class extends Controller {
  
	connect() {
		
		var grid = new Masonry(this.element, {
			// options
			itemSelector: ".card",
			columnWidth: ".card-sizer",
			percentPosition: true
		});
		
		imagesLoaded(this.element).on("progress", function() {
			// layout Masonry after each image loads
			grid.layout();
		});
		
  }
	
}
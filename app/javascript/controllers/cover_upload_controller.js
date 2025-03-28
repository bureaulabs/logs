import { Controller } from "@hotwired/stimulus"
import * as FilePond from "filepond"
// import FilePondPluginImagePreview from "filepond-plugin-image-preview";
// import FilePondPluginImageValidateSize from "filepond-plugin-image-validate-size";
// import FilePondPluginFileValidateType from "filepond-plugin-file-validate-type";
// import FilePondPluginFileValidateSize from "filepond-plugin-file-validate-size";

// FilePond.registerPlugin(FilePondPluginImagePreview);
// FilePond.registerPlugin(FilePondPluginImageValidateSize);
// FilePond.registerPlugin(FilePondPluginFileValidateType);
// FilePond.registerPlugin(FilePondPluginFileValidateSize);

export default class extends Controller {
	static targets = ["input"];
	
	connect() {
		// console.log(inputTarget)
		FilePond.create(this.inputTarget, {
			required: true,
			// stylePanelLayout: "integrated",
			allowImagePreview: true,
			// imagePreviewHeight: 100,
			allowImageValidateSize: true,
			imageValidateSizeMinWidth: 1000,
			imageValidateSizeMaxWidth: 4000,
			imageValidateSizeMinHeight: 1000,
			imageValidateSizeMaxHeight: 4000,
			allowFileTypeValidation: true,
			acceptedFileTypes: ["image/png", "image/jpeg", "image/gif"],
			allowFileSizeValidation: true,
			maxFileSize: 10000000,
			allowPaste: true,
			allowReorder: true,
			storeAsFile: true,
			allowMultiple: true,
			maxFiles: 3,
			credits: false,
			styleButtonRemoveItemPosition: "right",
			// stylePanelAspectRatio: 1,
			styleItemPanelAspectRatio: 1
		});
	}
	
}
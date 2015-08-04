// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require bootstrap-material-design
//= require toastr
//= require best_in_place
//= require sweet-alert
//= require sweet-alert-confirm
//= require_tree .


$(document).ready(function() {

	$.material.init()
	$(".best_in_place").best_in_place();

	 toastr.options = {
	                  "closeButton": false,
	                  "debug": false,
	                  "positionClass": "toast-bottom-right",
	                  "onclick": null,
	                  "showDuration": "300",
	                  "hideDuration": "1000",
	                  "timeOut": "5000",
	                  "extendedTimeOut": "1000",
	                  "showEasing": "swing",
	                  "hideEasing": "linear",
	                  "showMethod": "fadeIn",
	                  "hideMethod": "fadeOut"
	              }

	               $(".animsition").animsition({
  
    inClass               :   'fade-in',
    outClass              :   'fade-out',
    inDuration            :    500,
    outDuration           :    600,
    linkElement           :   '.animsition-link',
    // e.g. linkElement   :   'a:not([target="_blank"]):not([href^=#])'
    loading               :    true,
    loadingParentElement  :   'body', //animsition wrapper element
    loadingClass          :   'animsition-loading',
    unSupportCss          : [ 'animation-duration',
                              '-webkit-animation-duration',
                              '-o-animation-duration'
                            ],
    //"unSupportCss" option allows you to disable the "animsition" in case the css property in the array is not supported by your browser.
    //The default setting is to disable the "animsition" in a browser that does not support "animation-duration".
    
    overlay               :   false,
    
    overlayClass          :   'animsition-overlay-slide',
    overlayParentElement  :   'body'
  });


Dropzone.options.mediaDropzone = {
    //dictDefaultMessage:"hello",
    // previewTemplate: "<div class='dz-preview dz-file-preview'> <div class='dz-details'> <div class='dz-filename'><span data-dz-name></span></div> <div class='dz-size' data-dz-size></div> <img data-dz-thumbnail /> </div> <div class='dz-progress'><span class='dz-upload' data-dz-uploadprogress></span></div> <div class='dz-success-mark'><span>✔</span></div> <div class='dz-error-mark'><span>✘</span></div> <div class='dz-error-message'><span data-dz-errormessage></span></div> </div>",
    previewsContainer: ".drop-area",
    init: function() {
        this.on("dragenter", function(file) {
            $(".drop-area").addClass('show')
        }),
        this.on("dragend", function(file) {
        	console.log('exits')
            $(".drop-area").removeClass('show')
        }),
        this.on("addedfile", function(file) {
            $(".drop-area").addClass('show')
        }),
        // this.on("dragend", function(file) {
        //     $(".drop-area").removeClass('show')
        // }),
        // this.on("dragleave", function(file) {
        //     $(".drop-area").removeClass('show')
        // }),
        this.on("drop", function(file) {
            $(".dummy-area").fadeOut();
        }),
        this.on("success", function(file) {
			       var _this = this;

        	setTimeout(function(){
			        $(".drop-area").removeClass('show')

			        setTimeout(function(){
								 _this.removeAllFiles();
			          $(".dummy-area").show();}, 1000);
			         


			    },2500);

        })
        // this.on("addedfile", function(file) {
        // // Create the cancel link
        //     var cancelLink = Dropzone.createElement('<a href="javascript:undefined;">Cancel upload</a>');
        //     var that = this
        //     // Add the cancel link to the preview element
        //     // If you want it to replace another element, you can do that your way of course.
        //     file.previewElement.appendChild(cancelLink);
        //     // Now the most important part: attach the event listener here:
        //     cancelLink.addEventListener("click", function(e) {
        //         e.preventDefault();
        //         // Referencing file here as closure
        //         that.removeFile(file);
        //     });
        // });
    }
  };

	
	});



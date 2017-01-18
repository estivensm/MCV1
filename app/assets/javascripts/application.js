// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//


//= require jquery
//= require jquery_ujs
//= require reports
//= require chosen-jquery
//= require jquery_nested_form
//= require bootstrap-sprockets
//= require bootstrap-checkbox
//= require jquery-ui
//= require turbolinks
//= require ckeditor-jquery
//= require config
//= require_tree .


$(document).on('turbolinks:load',function() {

$('.translation_missing').html("Siguiente");
  $('.prev span').html("Anterior");

$('.ckeditor').ckeditor({
  // optional config
});


});


  $(function () {
  $('[data-toggle="popover"]').popover({
  	trigger: 'hover',
  	html: true
    
  
  })
})


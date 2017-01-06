$(document).on('turbolinks:load',function() {
  $('.chosen-select').chosen(
        {

          allow_single_deselect: true,
          no_results_text: 'No hay resultados',
          width: '350px;'

        });

$("#report_accion_si").prop('checked', 'checked')

$("#report_accion_si").change(function(){

if ($("#report_accion_si").prop('checked'))

{
  $(".just").fadeOut();
}

});

$("#report_accion_no").change(function(){

if ($("#report_accion_no").prop('checked'))

{
  $(".just").fadeIn();
}

});
});
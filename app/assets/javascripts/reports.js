$(document).on('turbolinks:load',function() {
  $('.chosen-select1').chosen(
        {

          allow_single_deselect: true,
          no_results_text: 'No hay resultados',
          width: '250px;',
          placeholder_text_single: "Seleccione una opción",
          placeholder_text_multiple: "Seleccione una varias opciones"

        });
 $('.chosen-select2').chosen(
        {

          allow_single_deselect: true,
          no_results_text: 'No hay resultados',
          width: '450px;',
          placeholder_text_single: "Seleccione una opción",
          placeholder_text_multiple: "Seleccione una varias opciones"

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
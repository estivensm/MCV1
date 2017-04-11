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
//= require jquery-ui
//= require jquery_ujs
//= require reports
//= require chosen-jquery
//= require jquery_nested_form
//= require bootstrap-sprockets
//= require bootstrap-checkbox
//= require jquery.remotipart
//= require jquery-ui
//= require ckeditor-jquery
//= require image-picker
//= require chartkick
//= require moment 
//= require fullcalendar
//= require config
//= require turbolinks
//= require_tree .


$(document).on('turbolinks:load',function() {

$('.translation_missing').html("Siguiente");
  $('.prev span').html("Anterior");

$('.ckeditor').ckeditor({
  // optional config
});
///calendar1
$("#calendar").fullCalendar({

    

 height: 500,

    selectable:true,
    selectHelper:true,
    editable:true,
     events: "/reports/get_reportsc",
     timeFormat: "h:mm t{ - h:mm t} ",
     monthNames: ['Enero','Febrero','Marzo','Abril','Mayo','Junio','Julio','Agosto','Septiembre','Octubre','Noviembre','Diciembre'],
        monthNamesShort: ['Ene','Feb','Mar','Abr','May','Jun','Jul','Ago','Sep','Oct','Nov','Dic'],
         dayNames: ['Domingo','Lunes','Martes','Miércoles','Jueves','Viernes','Sábado'],
    dayNamesShort: ['Dom','Lun','Mar','Mié','Jue','Vie','Sáb'],
    buttonText: ['Hoy', 'month', 'week', 'day', 'list'],
header: {
                left: 'prev,next Hoy',
                center: 'title',
                right: 'month,agendaWeek,today'
            },
buttonText:{
    today:    'Hoy',
    month:    'Mes',
    week:     'Semana',
    day:      'Dia',
    list:     'Lista'
}




  });
///
///calendar2
$("#calendari").fullCalendar({

    

 height: 500,

    selectable:true,
    selectHelper:true,
    editable:true,
     events: "/reports/get_invitadoc",
     timeFormat: "h:mm t{ - h:mm t} ",
     monthNames: ['Enero','Febrero','Marzo','Abril','Mayo','Junio','Julio','Agosto','Septiembre','Octubre','Noviembre','Diciembre'],
        monthNamesShort: ['Ene','Feb','Mar','Abr','May','Jun','Jul','Ago','Sep','Oct','Nov','Dic'],
         dayNames: ['Domingo','Lunes','Martes','Miércoles','Jueves','Viernes','Sábado'],
    dayNamesShort: ['Dom','Lun','Mar','Mié','Jue','Vie','Sáb'],
    buttonText: ['Hoy', 'month', 'week', 'day', 'list'],
header: {
                left: 'prev,next Hoy',
                center: 'title',
                right: 'month,agendaWeek,today'
            },
buttonText:{
    today:    'Hoy',
    month:    'Mes',
    week:     'Semana',
    day:      'Dia',
    list:     'Lista'
}




  });
///calendar 3
$("#calendara").fullCalendar({

    

 height: 500,

    selectable:true,
    selectHelper:true,
    editable:true,
     events: "/reports/get_asignadosc",
     timeFormat: "h:mm t{ - h:mm t} ",
     monthNames: ['Enero','Febrero','Marzo','Abril','Mayo','Junio','Julio','Agosto','Septiembre','Octubre','Noviembre','Diciembre'],
        monthNamesShort: ['Ene','Feb','Mar','Abr','May','Jun','Jul','Ago','Sep','Oct','Nov','Dic'],
         dayNames: ['Domingo','Lunes','Martes','Miércoles','Jueves','Viernes','Sábado'],
    dayNamesShort: ['Dom','Lun','Mar','Mié','Jue','Vie','Sáb'],
    buttonText: ['Hoy', 'month', 'week', 'day', 'list'],
header: {
                left: 'prev,next Hoy',
                center: 'title',
                right: 'month,agendaWeek,today'
            },
buttonText:{
    today:    'Hoy',
    month:    'Mes',
    week:     'Semana',
    day:      'Dia',
    list:     'Lista'
}




  });
//
$("#calendarmr").fullCalendar({

    

 

    selectable:true,
    selectHelper:true,
    editable:true,
     events: "/reports/get_misreportsc",
     timeFormat: "h:mm t{ - h:mm t} ",
     monthNames: ['Enero','Febrero','Marzo','Abril','Mayo','Junio','Julio','Agosto','Septiembre','Octubre','Noviembre','Diciembre'],
        monthNamesShort: ['Ene','Feb','Mar','Abr','May','Jun','Jul','Ago','Sep','Oct','Nov','Dic'],
         dayNames: ['Domingo','Lunes','Martes','Miércoles','Jueves','Viernes','Sábado'],
    dayNamesShort: ['Dom','Lun','Mar','Mié','Jue','Vie','Sáb'],
    buttonText: ['Hoy', 'month', 'week', 'day', 'list'],
header: {
                left: 'prev,next Hoy',
                center: 'title',
                right: 'month,agendaWeek,today'
            },
buttonText:{
    today:    'Hoy',
    month:    'Mes',
    week:     'Semana',
    day:      'Dia',
    list:     'Lista'
}




  });
//

 $(function () {
  $('[data-toggle="popover"]').popover({
    trigger: 'hover',
    html: true,
    container: 'body'
    
  
  })
})





});


 
 

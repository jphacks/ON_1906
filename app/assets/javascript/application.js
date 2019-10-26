//= require jquery
//= require moment
//= require fullcalendar
//= require fullcalendar/lang/ja

$(function () {
    function eventCalendar() {
        return $('#calendar').fullCalendar({});
    };
    function clearCalendar() {
        $('#calendar').html('');
    };
});

$(document).on('turbolinks:load', function () {
    eventCalendar();
});
$(document).on('turbolinks:before-cache', clearCalendar);

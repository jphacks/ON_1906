require("moment")
require("fullcalendar")

$(document).ready(function(){
  $('#calendar').fullCalendar({
        header: {
            // title, prev, next, prevYear, nextYear, today
            left: 'prev,next today',
            center: 'title',
            right: 'month agendaWeek agendaDay'
        },

    monthNames: ['1月', '2月', '3月', '4月', '5月', '6月', '7月', '8月', '9月', '10月', '11月', '12月'],
    monthNamesShort: ['1月', '2月', '3月', '4月', '5月', '6月', '7月', '8月', '9月', '10月', '11月', '12月'],

    // 土曜、日曜を表示
    weekends: true,
    
    // 曜日名称
    dayNames: ['日曜日', '月曜日', '火曜日', '水曜日', '木曜日', '金曜日', '土曜日'],
    
    // 曜日略称
    dayNamesShort: ['日', '月', '火', '水', '木', '金', '土'],
    

    //ボタン名称
    buttonText: {
      prevYear: '&laquo;',  // <<
      nextYear: '&raquo;',  // >>
      today:    '今日',
      month:    '月',
      week:     '週',
      day:      '日'
    }
    

  });
});

/**
 * Created by cmc on 18/03/2015.
 */

$(function(){
    $('#calendar').fullCalendar(
        {
            events: '/events.json',
            header: {
                left:   'title',
                center: 'month,basicWeek,basicDay prevYear,nextYear',
                right:  'today prev,next'
            }
        }
    );
});

//button handel
$(function(){

    $('#goto-date-button').click(function() {
        //$('#calendar').fullCalendar('next');
        date_input = $('#goto-date-input').val();
        date = moment(date_input);
        $('#calendar').fullCalendar('gotoDate',date);

    });
});

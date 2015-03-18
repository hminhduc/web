/**
 * Created by cmc on 18/03/2015.
 */

$(function(){
    $('#calendar').fullCalendar(
        {
            events: '/atops.json',
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
        date = moment('1979-05-28');
        $('#calendar').fullCalendar('gotoDate',date);

    });
});

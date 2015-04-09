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
    
    $('#search_user').click(function(){
        $('#select_user_modal').modal('show');
    });
});

// init hinme search table
$(function(){
    oTable = $('#user_table').DataTable({
        "pagingType": "full_numbers"
        // ,"scrollX": true,
        // ,"scrollCollapse": true
        ,"oLanguage":{
            "sUrl": "../../assets/resource/dataTable_ja.txt"
        }
        // ,"columnDefs": [
        //   {
        //     "targets": [3,4,5],
        //     "width": '15px'
        //   }
        // ]
    });

    //選択された行を判断
    $('#user_table tbody').on( 'click', 'tr', function () {

        var d = oTable.row(this).data();
        $('#selected_user').val(d[0]);
        $('#selected_user_name').val(d[1]);

        if ( $(this).hasClass('selected') ) {
            $(this).removeClass('selected');
            $(this).removeClass('success');
        }
        else {
            oTable.$('tr.selected').removeClass('selected');
            oTable.$('tr.success').removeClass('success');
            $(this).addClass('selected');
            $(this).addClass('success');
        }

    } );

});
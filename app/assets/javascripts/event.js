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
    
    $('#joutai_search').click(function(){
        $('#joutai_search_modal').modal('show');
    });
    
    $('#basho_search').click(function(){
        $('#basho_search_modal').modal('show');
    });
    
    $('#koutei_search').click(function(){
        $('#koutei_search_modal').modal('show');
    });
    
});

// init search table
$(function(){
    oTable = $('#user_table').DataTable({
        "pagingType": "simple_numbers"
        ,"oLanguage":{
            "sUrl": "../../assets/resource/dataTable_ja.txt"
        }
    });
    
    oBashoTable = $('#basho_table').DataTable({
        "pagingType": "simple_numbers"
        ,"oLanguage":{
            "sUrl": "../../assets/resource/dataTable_ja.txt"
        }
    });
    
    oJoutaiTable = $('#joutai_table').DataTable({
        "pagingType": "simple_numbers"
        ,"oLanguage":{
            "sUrl": "../../assets/resource/dataTable_ja.txt"
        }
    });
    
    oKouteiTable = $('#koutei_table').DataTable({
        "pagingType": "simple_numbers"
        ,"oLanguage":{
            "sUrl": "../../assets/resource/dataTable_ja.txt"
        }
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
    
    //場所選択された行を判断
    $('#basho_table tbody').on( 'click', 'tr', function () {

        var d = oBashoTable.row(this).data();
        $('#event_場所コード').val(d[0]);
        $('#basho_name').text(d[1]);

        if ( $(this).hasClass('selected') ) {
            $(this).removeClass('selected');
            $(this).removeClass('success');
        }
        else {
            oBashoTable.$('tr.selected').removeClass('selected');
            oBashoTable.$('tr.success').removeClass('success');
            $(this).addClass('selected');
            $(this).addClass('success');
        }

    } );
    //状態選択された行を判断
    $('#joutai_table tbody').on( 'click', 'tr', function () {

        var d = oJoutaiTable.row(this).data();
        $('#event_状態コード').val(d[0]);
        $('#joutai_name').text(d[1]);

        if ( $(this).hasClass('selected') ) {
            $(this).removeClass('selected');
            $(this).removeClass('success');
        }
        else {
            oJoutaiTable.$('tr.selected').removeClass('selected');
            oJoutaiTable.$('tr.success').removeClass('success');
            $(this).addClass('selected');
            $(this).addClass('success');
        }

    } );
    //工程選択された行を判断
    $('#koutei_table tbody').on( 'click', 'tr', function () {

        var d = oKouteiTable.row(this).data();
        $('#event_工程コード').val(d[0]);
        $('#koutei_name').text(d[1]);

        if ( $(this).hasClass('selected') ) {
            $(this).removeClass('selected');
            $(this).removeClass('success');
        }
        else {
            oKouteiTable.$('tr.selected').removeClass('selected');
            oKouteiTable.$('tr.success').removeClass('success');
            $(this).addClass('selected');
            $(this).addClass('success');
        }

    } );

});
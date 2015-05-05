/**
 * Created by cmc on 18/03/2015.
 */

$(function(){
    $('#calendar').fullCalendar(
        {
            events: '/events.json',
            header: {
                left:   'title',
                //center: 'month,basicWeek,basicDay prevYear,nextYear',
                center: 'month,agendaWeek,agendaDay prevYear,nextYear',
                right:  'today prev,next'
            }
        }
    );
});

//date field click handler
$(function () {
    
    $('#goto-date-input').datetimepicker({
        format: 'YYYY/MM/DD',
        widgetPositioning: {
            horizontal: 'left'
        },
        showTodayButton: true
    });
    //date_goto.showTodayButton(true);
    
    $('#event_開始').datetimepicker({
        format: 'YYYY/MM/DD h:m'
        ,showTodayButton: true

    });
    
    $('#event_終了').datetimepicker({
        format: 'YYYY/MM/DD h:m'
        ,showTodayButton: true

    });

    $("#event_開始").on("dp.change", function (e) {
        $('#event_終了').data("DateTimePicker").minDate(e.date);
    });
    
    $("#event_終了").on("dp.change", function (e) {
        $('#event_開始').data("DateTimePicker").maxDate(e.date);
    });
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

    oEventTable = $('#event_table').DataTable({
        "pagingType": "simple_numbers"
        ,"oLanguage":{
            "sUrl": "../../assets/resource/dataTable_ja.txt"
        }
        ,"aoColumnDefs": [{
            "aTargets": [0],
            "mRender": function (data, type, full) {
                return '<a href="/events/' + data + '/edit">詳細</a>';
            }
        }
            ,{ "bSortable": false, "aTargets": [ 0 ]}
            ,{
                "targets": [ 0 ],
                //"visible": false,
                "searchable": false
            }

        ]
        , 
        "order": [],
        "columnDefs": [ {
            "targets"  : 'no-sort',
            "orderable": false
        }]

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
        //$('#event_所属コード').val(d[0]);
        //$('#shozoku_name').val(d[1]);
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


//for handle ajax error
$(function () {
    $(document).bind('ajaxError', 'form#new_kouteimaster', function (event, jqxhr, settings, exception) {
        // note: jqxhr.responseJSON undefined, parsing responseText instead
        $(event.data).render_form_errors($.parseJSON(jqxhr.responseText));
    });

    //$(document).bind('ajaxSuccess', 'form#new_kouteimaster', function (event, jqxhr, settings, exception) {
    //    // note: jqxhr.responseJSON undefined, parsing responseText instead
    //    $(location).attr('href','/kouteimasters');
    //});
});

//defind ref functions
(function($) {

    $.fn.modal_success = function(){
        // close modal
        this.modal('hide');

        // clear form input elements
        // note: handle textarea, select, etc
        this.find('form input[type="text"]').val('');

        // clear error state
        this.clear_previous_errors();
    };

    $.fn.render_form_errors = function(errors){

        $form = this;
        this.clear_previous_errors();
        model = this.data('model');

        // show error messages in input form-group help-block
        $.each(errors, function(field, messages){
            $input = $('input[name="' + model + '[' + field + ']"]');
            $input.closest('.form-group').addClass('has-error').find('.help-block').html( messages.join(' & ') );
        });
    };

    $.fn.clear_previous_errors = function(){
        $('.form-group.has-error', this).each(function(){
            $('.help-block', $(this)).html('');
            $(this).removeClass('has-error');
        });
    }

}(jQuery));

// keydown trigger
$(function(){
    $('#event_状態コード').keydown( function(e) {
        if (e.keyCode == 9 && !e.shiftKey) {
            var event_状態コード = $('#event_状態コード').val();
            jQuery.ajax({
                url: '../ajax',
                data: {id: 'event_状態コード',event_状態コード: event_状態コード},
                type: "POST",
                // processData: false,
                // contentType: 'application/json',
                success: function(data) {
                    $('#joutai_name').text(data.joutai_name);
                    console.log("getAjax joutai_name:"+ data.joutai_name);
                },
                failure: function() {
                    console.log("event_状態コード keydown Unsuccessful");
                }
            });
        }
    });

    $('#event_場所コード').keydown( function(e) {
        if (e.keyCode == 9 && !e.shiftKey) {
            var event_場所コード = $('#event_場所コード').val();
            jQuery.ajax({
                url: '../ajax',
                data: {id: 'event_場所コード',event_場所コード: event_場所コード},
                type: "POST",
                // processData: false,
                // contentType: 'application/json',
                success: function(data) {
                    $('#basho_name').text(data.basho_name);
                    console.log("getAjax basho_name:"+ data.basho_name);
                },
                failure: function() {
                    console.log("event_場所コード keydown Unsuccessful");
                }
            });
        }
    });

    $('#event_工程コード').keydown( function(e) {
        if (e.keyCode == 9 && !e.shiftKey) {
            var event_工程コード = $('#event_工程コード').val();
            jQuery.ajax({
                url: '../ajax',
                data: {id: 'event_工程コード',event_工程コード: event_工程コード},
                type: "POST",
                // processData: false,
                // contentType: 'application/json',
                success: function(data) {
                    $('#koutei_name').text(data.koutei_name);
                    console.log("getAjax koutei_name:"+ data.koutei_name);
                },
                failure: function() {
                    console.log("event_工程コード keydown Unsuccessful");
                }
            });
        }
    });

});
/**
 * Created by cmc on 02/03/2015.
 */

//for multiselect
$(function(){
    //$('#multiselect_table').on('change', 'input[type=checkbox]', function(e) {
    //    //when is checked(this.value, this.name, this.checked)
    //    $that_check = this;
    //    if (this.checked){
    //        //$('#multiselect_table tbody tr').addClass('selected')
    //        //$that_check.closest('.tr').addClass('selected');
    //        console.log($that_check.checked);
    //    }else{
    //        console.log('false');
    //    }
    //
    //});
    oTable = $('#multiselect_table').DataTable({
        "pagingType": "full_numbers"
        ,"scrollX": false
        ,"autoWidth": false
        ,"scrollCollapse": false
        ,"oLanguage":{
            "sUrl": "../../assets/resource/dataTable_ja.txt"
        }
        //,"columnDefs": [
        //    {
        //        "targets": [0],
        //        //"width": '3px'
        //        "width": "5%"
        //    }
        //]
        ,"aoColumnDefs": [ {
                "aTargets": [ 1 ],
                "mRender": function ( data, type, full ) {
                    return '<a data-toggle="modal" href="#new_employer_modal">'+data+'</a>';
                }
            },
            { "bSortable": false, "aTargets": [ 0 ] },
            { "sClass": "fixcenter", "aTargets": [ 1 ] }
        ]
    });

    //選択された行を判断
    //$('#multiselect_table tbody').on( 'click', 'tr', function () {
    //
    //    if ( $(this).hasClass('selected') ) {
    //        $(this).removeClass('selected');
    //        $(this).removeClass('success');
    //    }
    //    else {
    //        oTable.$('tr.selected').removeClass('selected');
    //        oTable.$('tr.success').removeClass('success');
    //        $(this).addClass('selected');
    //        $(this).addClass('success');
    //    }
    //
    //} );


    //set data of selected row to modal
    $('#multiselect_table tbody').on( 'click', 'tr', function () {
        var d = oTable.row(this).data();
        $('#new_employer_modal').find('input[name="employer[first_name]"]').val(d[1]);
        $('#new_employer_modal').find('input[name="employer[position]"]').val(d[2]);
        $('#new_employer_modal').find('input[name="employer[office]"]').val(d[3]);
        $('#new_employer_modal').find('input[name="employer[age]"]').val(d[4]);
        $('#new_employer_modal').find('input[name="employer[start_date]"]').val(d[5]);
        $('#new_employer_modal').find('input[name="employer[salary]"]').val(d[6]);

    });

    $('#multiselect_table INPUT').click(function() {
        $(this).parent().parent().toggleClass('success');
    });

    //for get click to check all
    $('#multiselect_table thead').on( 'click', 'th', function () {
        var index = oTable.column( this ).index();
        if (index == 0){
            alert('chinh xax');
        }
    } );
});

//for handle ajax error
$(function () {
    $(document).bind('ajaxError', 'form#new_employer', function (event, jqxhr, settings, exception) {
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
        //this.find('form input[type="text"]').val('');
        this.find('input[type="text"]').val('');

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

//for button handel

$(function(){
    // Show new employer modal
    $('#add_new_employer').click(function(){
        $('#new_employer_modal').modal('show');

        $('#new_employer_modal').find('input[type="text"]').val('');

        // clear error state
        $('#new_employer_modal').clear_previous_errors();
    });

});
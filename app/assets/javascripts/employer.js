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
        ,"scrollX": true
        ,"scrollCollapse": true
        ,"oLanguage":{
            "sUrl": "../../assets/resource/dataTable_ja.txt"
        }
        ,"columnDefs": [
            {
                "targets": [0],
                "width": '5px'
            }
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

    $('#multiselect_table INPUT').click(function() {
        $(this).parent().parent().toggleClass('success');
    });
});

//for handle ajax error
$(function () {
    $(document).bind('ajaxError', 'form#employer', function (event, jqxhr, settings, exception) {
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

//for button handel

$(function(){
    // Show new employer modal
    $('#add_new_employer').click(function(){
        $('#new_employer_modal').modal('show');
    });
});
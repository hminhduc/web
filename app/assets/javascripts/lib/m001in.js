$(document).ready(function(){

oTable = $('#m001in_table').DataTable({
   "pagingType": "full_numbers",
   "scrollX": true,
		"scrollCollapse": true,
		"oLanguage":{
      "sUrl": "../../assets/resource/dataTable_ja.txt"
		},

	"columnDefs": [
		{
      "targets": [0,3],
      "width": '50px'
    },
		{
      "targets": 1,
      "width": '190px'
    },
		{
      "targets": 2,
      "width": '40px'
    },
		{
      "targets": 4,
      "width": '90px'
    },
		{
      "targets": 5,
      "width": '120px'
    },
		{
      "targets": 6,
      "width": '100px'
    },
		{
      "targets": [7,8],
      "width": '60px'
    },
		{
      "targets": 9,
      "width": '200px'
    },
		{
      "targets": [10,11],
      "width": '330px'
    }
    ]
	});

    	// oTable.columns.adjust().draw();

	//選択された行を判断
	$('#m001in_table tbody').on( 'click', 'tr', function () {
		//選択行のデータを取得
    var d = oTable.row( this ).data() ;
    console.log(d[0]);
    $("#selected_hinme_code").attr('value',d[0]);


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

	//add row
	$('#add').on('click',function(){
		// oTable.row.add(['1','1','1','1','1','1','1','1','1','1','1','1']).draw();
    $('#edit').modal('show');

	});
});
// .document

$.fn.inlineEdit = function(replaceWith, connectWith) {

    $(this).hover(function() {
        $(this).addClass('hover');
    }, function() {
        $(this).removeClass('hover');
    });

    $(this).click(function() {

        var elem = $(this);

        elem.hide();
        elem.after(replaceWith);
        replaceWith.focus();

        replaceWith.blur(function() {

            if ($(this).val() != "") {
                connectWith.val($(this).val()).change();
                elem.text($(this).val());
            }

            $(this).remove();
            elem.show();
        });
    });
};

var replaceWith = $('<input name="temp" type="text" class="form-control" style="width: 70px"/>'),
    connectWith = $('input[name="cell_input"]');
$(function(){
	// $('m001in_table td').inlineEdit(replaceWith, connectWith);
	// $('tr td').inlineEdit(replaceWith, connectWith);
});

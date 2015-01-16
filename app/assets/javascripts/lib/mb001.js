var oTable;
var selected_id, selected_name;

$(document).ready(function() {


	oTable = $('#example').DataTable({
   // "sDom": 'T<"clear">lfrtip',
   "oTableTools": {
        "sSwfPath": "../../assets/resource/copy_csv_xls_pdf.swf"
  },
   "pagingType": "full_numbers",
   "autoWidth": true,
   "scrollX": true,
   // "scrollY": "200px",
		"scrollCollapse": true,
		// "paging":false,
		"oLanguage":{
      "sUrl": "../../assets/resource/dataTable_ja.txt"
		}


	});

	//選択された行を判断
	$('#example tbody').on( 'click', 'tr', function () {
		//選択行のデータを取得
    var d = oTable.row( this ).data() ;
    console.log(d[0]);
    selected_id = d[0];
    selected_name = d[1];
    $("#selected_code").attr('value',d[0]);
    $("#edit_tanto_group_code").attr('value',d[0]);
    $("#edit_tanto_group_name").attr('value',d[1]);


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

	$('#add').click(function(){
    $("#selected_button").attr('value','1');
    $('#add_modal').modal('show');

	});

  $('#edit').click(function(){
    $("#selected_button").attr('value','2');
    $('#edit_modal').modal('show');
  });

	$('#edit_update').click(function(){
    $("#selected_button").attr('value','edit_update');
    var edit_code = $("#edit_tanto_group_code").attr('value');
    var edit_name = $("#edit_tanto_group_name").attr('value');
    console.log(edit_code);
    jQuery.ajax({
      url: 'getAjax',
      data: {edit_code: edit_code, edit_name: edit_name},
      type: "POST",
      success: function(data) {
        console.log(data.status);
        $('#edit_modal').modal('hide');
        },
      failure: function() {
        console.log("Unsuccessful");
      }
    });
	});

	$('#delete').click(function(){
    $("#selected_button").attr('value','3');
		jQuery.ajax({
          url: 'create',
          data: {selected_value: selected_id},
          type: "POST",
          success: function(data) {
            // alert(data.message+data.name);
	            console.log(data.status);
							oTable
								.rows('.selected')
								.remove()
								.draw();
            },
          failure: function() {
            console.log("Unsuccessful");
          }
        });
  });
/*
$(function(){

	$('#save_edit').click(function(){
	  var input_group_id = $('#group_id').val();
	  var input_group_name = $('#group_name').val();

		jQuery.ajax({
			url: 'edit',
			data: {input_group_id: input_group_id , input_group_name: input_group_name},
			type: 'POST',
			success: function(data){
				// console.log('Save success!');
				console.log("update success");
				console.log(data);
			},
			failure: function(){
				console.log("Cannot save edit here..");
			}
		});
		return false;
	});

})*/
	console.log('End of document ready');

} );
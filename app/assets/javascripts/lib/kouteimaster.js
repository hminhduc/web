$(document).ready(function(){

  oTable = $('#kouteimaster').DataTable({
    "pagingType": "full_numbers",
    "scrollX": true,
    "scrollCollapse": true,
    "oLanguage":{
      "sUrl": "../../assets/resource/dataTable_ja.txt"
    },
    "columnDefs": [
      {
        "targets": [3,4,5],
        "width": '15px'
      }
    ]
  });

	//選択された行を判断
	$('#kouteimaster tbody').on( 'click', 'tr', function () {

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

$(document).ready(function(){

  oTable = $('#tantoshas').DataTable({
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

  new $.fn.dataTable.FixedColumns( oTable, {
        leftColumns: 0,
        rightColumns: 3
    } );

  //選択された行を判断
  $('#tantoshas tbody').on( 'click', 'tr', function () {
    //選択行のデータを取得
    var d = oTable.row( this ).data() ;
    console.log(d[0]);

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
  });
});
// .document
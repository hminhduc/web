var koutei_code, koutei_name

$(document).ready(function(){

  oTable = $('#job').DataTable({
    "pagingType": "full_numbers",
    "scrollX": true,
    "scrollCollapse": true,
    "oLanguage":{
      "sUrl": "../../assets/resource/dataTable_ja.txt"
    },
    "columnDefs": [
      {
        "targets": [4],
        "width": '15px'
      }
    ]
  });


  oTable_koutei_sentaku = $('#koutei_sentaku_table').DataTable({
    "pagingType": "full_numbers",
    // "scrollX": true,
    "scrollCollapse": true,
    "oLanguage":{
      "sUrl": "../../assets/resource/dataTable_ja.txt"
  	}
  });

  // new $.fn.dataTable.FixedColumns( oTable, {
  //       leftColumns: 0,
  //       rightColumns: 3
  //   } );

  //選択された行を判断
  $('#koutei_sentaku_table tbody').on( 'click', 'tr', function () {
    //選択行のデータを取得
    var d = oTable_koutei_sentaku.row( this ).data() ;
    koutei_code = d[1]
    koutei_name = d[2]
    if ( $(this).hasClass('selected') ) {
        $(this).removeClass('selected');
        $(this).removeClass('success');
    }
    else {
        oTable_koutei_sentaku.$('tr.selected').removeClass('selected');
        oTable_koutei_sentaku.$('tr.success').removeClass('success');
        $(this).addClass('selected');
        $(this).addClass('success');
    }
  });

  //選択された行を判断
  $('#job tbody').on( 'click', 'tr', function () {
    //選択行のデータを取得
    var d = oTable.row( this ).data() ;

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

  // OK from modal search kotei
  $('#koutei_sentaku_ok').click(function(){
    $('#kotei_sentaku_modal').modal('hide')
    $('#shozai_所在名').attr('value',koutei_code)
    $('#shozai_name_display').text(koutei_name)
  });

// keydown trigger
$('#shozai_所在名').keydown( function(e) {
    if (e.keyCode == 9 && !e.shiftKey) {
      var koutei_code = $('#shozai_所在名').val();
      jQuery.ajax({
          url: 'getAjax',
          data: {id: 'shozai_所在名',koutei_code: koutei_code},
          type: "POST",
          // processData: false,
          // contentType: 'application/json',
          success: function(data) {
              $('#shozai_name_display').text(data.koutei_name);
            },
          failure: function() {
            console.log("shozai_所在名 keydown Unsuccessful");
          }
      });
    }
  });

});
// .document
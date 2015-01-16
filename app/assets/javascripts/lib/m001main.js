var pw_selected_hinme;

$(document).ready(function() {


	oTable = $('#example').DataTable({
   // "sDom": 'T<"clear">lfrtip',
  //  "oTableTools": {
  //       "sSwfPath": "../../assets/resource/copy_csv_xls_pdf.swf"
  // },
   // "pagingType": "full_numbers",
   // "autoWidth": true,
   // "scrollX": true,
   scrollY: 200,
		scrollCollapse: true,
		// "paging":false,
		"oLanguage":{
      "sUrl": "../../assets/resource/dataTable_ja.txt"
		},
    deferRender:    true,
    dom:            "frtiS",
	});

	//選択された行を判断
	$('#example tbody').on( 'click', 'tr', function () {
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


	// After tab key press
	//kozo input
  $('#header_kozo').keydown( function(e) {
    if (e.keyCode == 9 && !e.shiftKey) {
    	var kozo_code = $('#header_kozo').val();
      jQuery.ajax({
          url: 'getAjax',
          data: {id: 'header_kozo',kozo_code: kozo_code},
          type: "POST",
          success: function(data) {
	            $('#header_kozo_name').attr('value',data.kozo_name);
            },
          failure: function() {
            console.log("Unsuccessful");
          }
      });
    }
  });

  //hinme input
  $('#header_hinme').keydown( function(e) {
    if ((e.keyCode == 9 || e.keyCode == 13) && !e.shiftKey) {
    	retrieve_hinme();
    }
  });

	// $('body').on('keydown', '#header_hinme', function(e) {
 //    if (e.which == 9) {
 //        e.preventDefault();
 //        // do your code
 //        console.log('test');
 //        alert('test');
 //    }
	// });
  dropdown_tani_select();
});//_END_

function dropdown_tani_select(){
	$('#tani_select li').click(function() {
      $('#header_tani').val($(this).text());
  });
}

//date field click handler
$(function () {
  $('#datetimepicker5').datetimepicker({
      pickTime: false,
      language: 'ja-JA'
  });
});

// Button click handler
$(function(){
  //ツリービュー修正
  $('#tree_update').click(function(){

    $('#selected_button').attr('value','tree_update');
  });
  //検索
  $('#search').click(function(){
    $('#selected_button').attr('value','search');

  });
  //キャンセル
  $('#cancel').click(function(){
    $('#selected_button').attr('value','cancel');

  });
  //閉じる
  $('#close').click(function(){
    $('#selected_button').attr('value','close');
    // bootbox.confirm('画面を終了します。宜しいですか？',function(result){
    //   if (result){
    //     window.location.replace('/main001/index');
    //   }
    // });
  });
  //新規
  $('#new').click(function(){
    $('#selected_button').attr('value','new');

  });
  //close confirm
  $('#msg_ok').click(function(){
    $('#msgbox').modal('hide');
    window.location.replace('/main001/index');

  });
  //save_pw_hin
  $('#hinme_search_ok').click(function(){
    $('#pw_hin').modal('hide');
    $('#header_hinme').attr('value',pw_selected_hinme);
    retrieve_hinme();
  });
  //pw_hinme
  $('#pw_hinme_search').click(function(){
    $('#selected_button').attr('value','pw_hinme_search');
  });
});

//reload page then read hinme for retrieve nisugata
$(function(){
  retrieve_hinme();
});

//Add maxlength display
$(function(){
  $('input[maxlength]').maxlength();

});

//DataTable for pw_hinme_search
$(function(){
  pw_hinme_table = $('#pw_hinme_table').DataTable({
   "pagingType": "full",
   // "autoWidth": true,
   // "scrollX": true,
   // "scrollY": "200px",
    "scrollCollapse": true,
    // "paging":false,
    "oLanguage":{
      "sUrl": "../../assets/resource/dataTable_ja.txt"
    }
  });

  //選択された行を判断
  $('#pw_hinme_table tbody').on( 'click', 'tr', function () {
    //選択行のデータを取得
    var d = pw_hinme_table.row( this ).data() ;
    pw_selected_hinme = d[0];


    if ( $(this).hasClass('selected') ) {
        $(this).removeClass('selected');
        $(this).removeClass('success');
    }
    else {
        pw_hinme_table.$('tr.selected').removeClass('selected');
        pw_hinme_table.$('tr.success').removeClass('success');
        $(this).addClass('selected');
        $(this).addClass('success');
    }

  } );
});

function retrieve_hinme(){
  var hinme_code = $('#header_hinme').val();
      jQuery.ajax({
          url: 'getAjax',
          data: {id: 'header_hinme', hinme_code: hinme_code},
          type: "POST",
          success: function(data) {
              $('#header_hinme_name').attr('value',data.hinme_name);
              var dropdown_value = data.dropdown

              for (var i = 0; i < 10; i++) {
                $('.flag').remove();
              };

              for (var i = 0; i < dropdown_value.length; i++) {
                $('#tani_select').append("<li class = 'flag'><a href='#'>" + dropdown_value[i] + '</a></li>');
                dropdown_tani_select();
              };
            },
          failure: function() {
            console.log("Unsuccessful");
          }
      });
}

$(function(){
  var check_flag = $('#check_flag').attr('value');
  if (check_flag == '1')
  {
    $('#pw_hin').modal('show');
  }
});
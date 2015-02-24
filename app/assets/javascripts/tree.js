// $(document).ready(function() { = $(function(){...});

// tree init
$(function(){

	// 6 create an instance when the DOM is ready
	$('#jstree').jstree();

	// 7 bind to events triggered on the tree
	$('#jstree').on("changed.jstree", function (e, data) {
    console.log(data.selected);
  });

  // 8 interact with the tree - either way is OK
  // $('button').on('click', function () {
  //   $('#jstree').jstree(true).select_node('child_node_1');
  //   $('#jstree').jstree('select_node', 'child_node_1');
  //   $.jstree.reference('#jstree').select_node('child_node_1');
  // });

});

	// $('#jstree_bt').on('click', function(){
	// 	$('#jstree').jstree('close_all');
	// 	console.log('clicked')
	// });

$(function(){
	// keydown trigger
	$('#header_hinme').keydown( function(e) {
    if (e.keyCode == 9 && !e.shiftKey) {
      var hinme_code = $('#header_hinme').val();
      jQuery.ajax({
          url: 'call_by_ajax',
          data: {id: 'header_hinme',hinme_code: hinme_code},
          type: "POST",
          // processData: false,
          // contentType: 'application/json',
          success: function(data) {
              $('#header_hinme_name').val(data.hinme_name);
              console.log("getAjax success:"+ data.hinme_name);
            },
          failure: function() {
            console.log("header_hinme keydown Unsuccessful");
          }
      });
    }
  });

});

//Button hander
$(function(){
	//閉じる
	$('#close').click(function(){
		$('#selected_button').attr('value','close');
	});
	//キャンセル
	$('#cancel').click(function(){
		$('#selected_button').attr('value','cancel');
	});
	//検索
	$('#search').click(function(){
		$('#selected_button').attr('value','search');
	});

	// Show hinme modal
	$('#hinme_search').click(function(){
		$('#hinme_search_modal').modal('show');
	});

	//OK from Search
	$('#btn_hinme_search_ok').click(function(){
		$('#header_hinme').val(hinme_search_code);
		$('#header_hinme_name').val(hinme_search_name);
	});

	// Show new employer modal
	$('#add_new_employer').click(function(){
		$('#new_employer_modal').modal('show');
	});

});

//date field click handler
$(function () {
  $('#datetimepicker5').datetimepicker({
      pickTime: false,
      language: 'ja-JA'
  });
});

//Add maxlength display
$(function(){
  $('input[maxlength]').maxlength();
  
});

var hinme_search_code, hinme_search_name
// init hinme search table
$(function(){
	oTable = $('#hinme_search_table').DataTable({
    "pagingType": "full_numbers"
    // ,"scrollX": true,
    // ,"scrollCollapse": true
    ,"oLanguage":{
      "sUrl": "../../assets/resource/dataTable_ja.txt"
  	}
    // ,"columnDefs": [
    //   {
    //     "targets": [3,4,5],
    //     "width": '15px'
    //   }
    // ]
  });

  //選択された行を判断
	$('#hinme_search_table tbody').on( 'click', 'tr', function () {

		var d = oTable.row(this).data();
		hinme_search_code = d[0];
		hinme_search_name = d[1];

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

// tab key when input mail address
$(function(){
  // keydown trigger
  $('#person_email').keydown( function(e) {
    if (e.keyCode == 9 && !e.shiftKey) {
      var email = $('#person_email').val();
      jQuery.ajax({
          url: 'emailxhr',
          data: {id: 'email',email: email},
          type: "POST",
          // processData: false,
          // contentType: 'application/json',
          success: function(data) {
              if (data.error == "true"){
                $('span').text("Someone already has that username. Try another?");
              }
              console.log("email success:");
            },
          failure: function() {
            console.log("email Unsuccessful");
          }
      });
    }
  });

});

//for scroll horizontal of table
$(function(){
  oTable = $('#scroll_horizontal_table').DataTable({
    "pagingType": "full_numbers"
     ,"scrollX": true
     // ,"scrollCollapse": true
    ,"oLanguage":{
      "sUrl": "../../assets/resource/dataTable_ja.txt"
    }
    // ,"columnDefs": [
    //   {
    //     "targets": [3,4,5],
    //     "width": '15px'
    //   }
    // ]
  });
});

//for scroll vertical of table
$(function(){
  oTable = $('#scroll_vertical_table').DataTable({
    // "pagingType": "full_numbers"
    "paging": false
     ,"scrollY": "200px"
     ,"scrollCollapse": true
    ,"oLanguage":{
      "sUrl": "../../assets/resource/dataTable_ja.txt"
    }
    // ,"columnDefs": [
    //   {
    //     "targets": [3,4,5],
    //     "width": '15px'
    //   }
    // ]
  });
});

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

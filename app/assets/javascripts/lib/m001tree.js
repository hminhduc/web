$(document).ready(function() {
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

});

//date field click handler
$(function () {
  $('#datetimepicker5').datetimepicker({
      pickTime: false,
      language: 'ja-JA'
  });
});


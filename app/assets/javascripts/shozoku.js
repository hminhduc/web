// init search table
$(function() {
    oTable = $('#shozokumaster').DataTable({
        "pagingType": "simple_numbers"
        , "oLanguage": {
            "sUrl": "../../assets/resource/dataTable_ja.txt"
        }
    });
});
function drawAppsTable(data, callback) {
  var columns = data.columns;
  var appData = data.app_data;
  var selectCols = [3, 4, 10];
  var thDivs = $(columns).map(function() {
    return "<th>"+this.title+"</th>";
  }).get().join('');
  $("#table-placeholder").html("<table id='tbl' class='table table-striped table-bordered' data-toggle='table'><tfoot>" + thDivs + "</tfoot></table>");
  var table = $('#tbl').DataTable({
    scrollY:     650, // pixels
    scrollCollapse: true,
    "deferRender": true,
    "order": [[ 0, 'desc' ]], // sort on Order column
    // "stateSave": true, // buggers initial ordering
    "data": appData,
    "columns": columns,

    initComplete: function () {
      this.api().columns().every(function() {
        var column = this;

        if(selectCols.includes(this.index())) {

          var select = $('<select><option value=""></option></select>')
            .appendTo( $(column.footer()).empty() )
            .on( 'change', function() {
              var val = $.fn.dataTable.util.escapeRegex(
                $(this).val()
              );
              column.search( val ? '^'+val+'$' : '', true, false ).draw();
              });
              column.data().unique().sort().each( function( d, j) {
                select.append( '<option value="'+d+'">'+d+'</option>' );
              });

        } // end if

      }); // end ecolumn iteration

    } // end initComplete
  }); // end DataTable
  table.column(0).visible(false); // hide Order column
}

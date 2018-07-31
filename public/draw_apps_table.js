function drawAppsTable(data, callback) {
  var columns = data.columns;
  var appData = data.app_data;
  // var thDivs = $(columns).map(function() {
  //   return "<th>"+this.title+"</th>";
  // }).get().join('');
  // $("#table-placeholder").html("<table id='tbl' class='table stripe table-bordered' data-toggle='table'><tfoot>" + thDivs + "</tfoot></table>");
  $("#table-placeholder").html("<table id='tbl' class='table stripe table-bordered' data-toggle='table'></table>");
  var table = $('#tbl').dataTable({
    scrollY:     530, // pixels
    scrollCollapse: true,
    "deferRender": true,
    "order": [],
    "stateSave": true, // so user can navigate back to same view
    "data": appData,
    "columns": columns
  });
}

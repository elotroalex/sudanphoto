$(document).ready(function() {
  $('input#search').on('keyup', function () {
    var resultdiv = $('#results');
    var query = $(this).val();
    var result = index.search(query, {expand: true});
    resultdiv.empty();
    for (var item in result) {
      var ref = result[item].ref;
      var searchitem = '<div class="result"><b><a href="' + store[ref].link + '">' + store[ref].title + '</a></b><br><p>'  + store[ref].description + ' / ' + store[ref]._date + '</p></div>';
      resultdiv.append(searchitem);
    }
  });
});

$(document).ready(function() {
  $('input#search').on('keyup', function () {

    var results_div = $('#results');
    var query = $(this).val();
    var results = index.search(query, {expand: true});

    results_div.empty();

    for (var item in results) {

      var ref   = results[item].ref;
      var link  = store[ref].link;
      var title = store[ref].title;
      var desc  = store[ref].description;
      var date  = store[ref]._date;
      var coll  = store[ref].collection;
      var meta  = desc + ' / ' + date + ' / ' + coll;

      if (store[ref].on_website == 'yes') {
        meta = '&#127748; ' + meta;
        console.log("TRUE " + meta);
      }

      var result = '<div class="result"><b><a href="' + link + '">' + title + '</a></b><br><p>' + meta +'</p></div>';
      results_div.append(result);
    }
  });
});

$(document).ready(function() {
  $('input#search').on('keyup', function () {

    var results_div = $('#results');
    var query = $(this).val();
    var results = index.search(query, {expand: true});
    var sorted = [];

    for (var r in results){
      var ref = results[r].ref;
      var obj  = store[ref];
      if (obj.on_website == 'yes') {sorted.unshift(ref);}
      else {sorted.push(ref);}
    }

    results_div.empty();
    for (var s in sorted) {
      var idx   = sorted[s];
      var item  = store[idx];
      var link  = item.link;
      var title = item.title;
      var desc  = item.description;
      var date  = item._date;
      var coll  = item.collection;
      var meta  = desc + ' / ' + date + ' / ' + coll;
      if (item.on_website == 'yes') { meta = '&#127748; ' + meta;}

      var result = '<div class="result"><b><a href="' + link + '">' + title + '</a></b><br><p>' + meta +'</p></div>';
      results_div.append(result);
    }
  });
});

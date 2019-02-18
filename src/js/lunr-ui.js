---
layout: none
---
$.getJSON("{{ site.baseurl }}/js/lunr-index.json", function(index_json) {
  window.index = new elasticlunr.Index;
  window.store = index_json;
  index.saveDocument(false);
  index.setRef('lunr_index');
  index.addField('pid');
  index.addField('title');
  index.addField('rights');
  index.addField('description');
  index.addField('collection');
  index.addField('_date');
  index.addField('on_website');
  index.addField('language');
  // add docs
  for (i in store) {
    index.addDoc(store[i]);
  }
  $('input#search').on('keyup', function () {
    var results_div = $('#results');
    var query = $(this).val();
    var results = index.search(query, {bool: "AND", expand: true});
    var sorted = [];
    for (var r in results){ // loop to sort results with online images to the front
      var ref = results[r].ref;
      var obj  = store[ref];
      if (obj.on_website == 'yes') {sorted.unshift(ref);}
      else {sorted.push(ref);}
    }
    results_div.empty();
    results_div.prepend(`<p><small>Displaying ${sorted.length} results.</small></p>`);
    for (var s in sorted) { // limit visible results to 10
      var idx   = sorted[s];
      var item  = store[idx];
      var link  = item.link;
      var title = item.title;
      var desc  = item.description;
      var date  = item._date;
      var coll  = item.collection;
      var meta  = desc + ' / ' + date + ' / ' + coll;
      if (item.on_website == 'yes') { meta = '&#127748; ' + meta;} // add image icon if image is online
      var result = '<div class="result"><b><a href="' + link + '">' + title + '</a></b><br><p>' + meta +'</p></div>';
      results_div.append(result);
    }
  });
});

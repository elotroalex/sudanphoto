# sudanphoto 🇸🇩 📷

A collaboration between University of Khartoum ([uofk](http://uofk.edu/index.php/en/)) & Columbia University Group for Experimental Methods in the Humanities ([xpmethod](https://github.com/xpmethod)).

## I. Add data
1. Clone the repository and change directory into it.<br><br>
2. Run __$__ `bundle install`<br><br>
3. Add or replace the metadata file (e.g. `photos.csv`) in the `_data` directory.<br><br>
4. Run __$__ `bundle exec rake process <filename>`. For the example of `photos.csv`, you would run __$__ `bundle exec rake process photos`.<br><br>

__By running this command, the site will:__

- Split the CSV file into two CSV files sorted by language<br>(e.g. `photos.csv` creates `photos-ar.csv` and `photos-en.csv`)<br><br>
- Generate Markdown pages from the data<br>(e.g. the data from `photos-ar.csv` will ve used to generate Arabic pages in `photopages/ar/`)<br><br>
- Regenerate the Elasticlunr index that powers the search functions.<br><br>

## II. Run tests
5. Run __$__ `bundle exec rake wax:tests`. This will run the `htmlproofer` tests on the compiled site files as well as the `rspec` tests on the search functions.<br><br>

## III. Commit your changes and publish to s3 branch
6. If all looks good and the tests pass, do the usual `git add`, `git commit`, and `git push`.
7. Next, run __$__ `bundle exec rake wax:s3branch`. This will push the compiled `_site` to a branch called `s3` that can be used to clone *only the compiled site* onto the actual server.

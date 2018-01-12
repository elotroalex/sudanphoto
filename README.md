# sudanphoto 🇸🇩 📷
[![Build Status](https://travis-ci.org/mnyrop/sudanphoto.svg?branch=html-proofer)](https://travis-ci.org/mnyrop/sudanphoto) [![Dependency Status](https://gemnasium.com/badges/github.com/mnyrop/sudanphoto.svg)](https://gemnasium.com/github.com/mnyrop/sudanphoto)

A collaboration between University of Khartoum ([uofk](http://uofk.edu/index.php/en/)) & Columbia University Group for Experimental Methods in the Humanities ([xpmethod](https://github.com/xpmethod)).

## I. Add data
1. Clone the repository and change directory into it.
2. Run __$__ `bundle install`
3. Add or replace the metadata file (e.g. `photos.csv`) in the `_data` directory.
4. Run __$__ `bundle exec rake process <filename>`. For the example of `photos.csv`, you would run __$__ `bundle exec rake process photos`.

__By running this command, the site will:__

- Split the CSV file into two CSV files sorted by language<br>(e.g. `photos.csv` creates `photos-ar.csv` and `photos-en.csv`)
- Generate Markdown pages from the data<br>(e.g. the data from `photos-ar.csv` will ve used to generate Arabic pages in `photopages/ar/`)
- Regenerate the Elasticlunr index that powers the search functions.

## II. Run tests
5. Run __$__ `bundle exec rake wax:tests`. This will run the `htmlproofer` tests on the compiled site files as well as the `rspec` tests on the search functions.<br><br>

## III. Commit your changes and publish to s3 branch
6. If all looks good and the tests pass, do the usual `git add`, `git commit`, and `git push`.
7. Next, run __$__ `bundle exec rake wax:s3branch`. This will push the compiled `_site` to a branch called `s3` that can be used to clone *only the compiled site* onto the actual server.

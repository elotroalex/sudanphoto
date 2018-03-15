# sudanphoto 🇸🇩 📷
[![Build Status](https://travis-ci.org/mnyrop/sudanphoto.svg?branch=html-proofer)](https://travis-ci.org/mnyrop/sudanphoto) [![Dependency Status](https://gemnasium.com/badges/github.com/mnyrop/sudanphoto.svg)](https://gemnasium.com/github.com/mnyrop/sudanphoto)

A collaboration between University of Khartoum ([uofk](http://uofk.edu/index.php/en/)) & Columbia University Group for Experimental Methods in the Humanities ([xpmethod](https://github.com/xpmethod)).

## I. Add data
1. Clone the repository and `cd` into it.
2. Run __$__ `bundle install`
3. Add or replace the metadata file (e.g. `archive.csv`) in the `_data` directory.
4. Run __$__ `bundle exec rake process <filename>`. For the example of `archive.csv`, you would run __$__ `bundle exec rake process archive`.

__By running this command, the site will:__

- Split the CSV file into two CSV files sorted by language<br>(e.g. `archive.csv` creates `archive-ar.csv` and `archive-en.csv`)
- Generate Markdown pages from the data<br>(e.g. the data from `archive-ar.csv` will be used to generate Arabic pages in `archive/ar/`)
- Regenerate the Elasticlunr index that powers the search functions.

## II. Build the site
5. Run __$__ `bundle exec jekyll build`. (You can add `-V` to make the build process verbose or `-I` to make it incremental.)

## III. Run tests
6. Run __$__ `bundle exec rake wax:test`. This will run the `htmlproofer` tests on the compiled site files as well as the `rspec` tests on the search functions.<br><br>

## IV. Commit your changes and publish to s3 branch
7. If all looks good and the tests pass, do the usual `git add`, `git commit`, and `git push`.
8. Next, run __$__ `bundle exec rake wax:s3branch`. This will push the compiled `_site` to a branch called `s3` that can be used to clone *only the compiled site* onto the actual server.

## V. Clone s3 branch with static compiled `_site` onto server.
9. On the production server, clone *only* the `s3` branch by running the command:

  `$ git clone https://github.com/rmglade/sudanphoto.git -b s3`

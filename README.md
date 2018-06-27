# sudanphoto 🇸🇩📷
[![Build Status](https://travis-ci.org/mnyrop/sudanphoto.svg?branch=html-proofer)](https://travis-ci.org/rmglade/sudanphoto)
![Libraries.io for GitHub](https://img.shields.io/librariesio/github/mnyrop/sudanphoto.svg)


A collaboration between University of Khartoum ([uofk](http://uofk.edu/index.php/en/)) & Columbia University Group for Experimental Methods in the Humanities ([xpmethod](https://github.com/xpmethod)).

# contributing

To contribute changes to the site, you will need to:
- Clone the repository from GitHub `$ git clone https://github.com/rmglade/sudanphoto.git`
- Install the dependencies `$ bundle install`
- Serve the site locally `$ bundle exec jekyll serve`
- Make your changes (see below)
- Test the site `$ bundle exec rake wax:test`
- Push your changes back to GitHub `$ git push`

> __Note:__  When adding a substantial amount of content and/or adding a new feature, you should check out a new Git branch with `$ git checkout -b my-branch-name` and use a formal pull request to merge that branch into `master`.

### add/edit collection items

To add or edit any collection items, simply replace the `archive.csv` file in the `_data` directory with your updated version. If you would like to see your updates locally before pushing them back to GitHub, just run `$ bundle exec rake process archive` before serving the site (with `$ bundle exec jekyll serve`).

This `process` task will: split the `archive.csv` file by language, use the data to generate the archive's item pages (both Arabic and English), and regenerate the search index. Travis-CI will run this task for you, so you only need to do this step if you want to see your changes locally.

> __Note:__ Make sure to delete the `_archive` directory if it's there and you want to regenerate.

### add/edit static page design

To add static pages and/or edit the design, make sure you have tested everything thoroughly. Certain blocks (like the search box) should not be altered without checking in with admins.

# deploying

Any commit or successfully merged pull request into the `master` branch will trigger a complete rebuild of the site and will run several tests on [Travis-CI](https://travis-ci.org/rmglade/sudanphoto). If these tests pass, Travis will automatically push a copy of the compiled site to a branch called `static`.

When a new version of master has been built and a new copy of the `static` branch is ready, the UofK web administrator can clone **just the static branch onto the production server** using the command: `$ git clone https://github.com/rmglade/sudanphoto.git -b static`

# issues

Please submit any issues, questions, and feature requests to the canonical repository: <https://github.com/rmglade/sudanphoto/issues>.

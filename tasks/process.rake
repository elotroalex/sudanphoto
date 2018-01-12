desc "Split data, generate pages and regenerate lunr index when csv is added to _data"
task :process do
  Rake::Task['wax:config'].invoke
  Rake::Task['csv_split'].invoke
  Rake::Task['wax:pagemaster'].invoke
  Rake::Task['wax:lunr'].invoke
end

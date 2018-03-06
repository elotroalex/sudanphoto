
desc "Split data, generate pages and regenerate lunr index when csv is added to _data"
task :process do
  argv = ARGV.drop(1)
  argv.each { |a| task a.to_sym do ; end }
  system("bundle exec rake csv_split #{argv.join(' ')}")
  argv2 = []
  argv.each { |a| argv2 << [a + "/en", a + "/ar"] }
  system("bundle exec rake wax:pagemaster #{argv2.join(' ')}")
  Rake::Task['wax:lunr'].invoke
end

# Load tasks from wax_tasks
spec = Gem::Specification.find_by_name 'wax_tasks'
Dir.glob("#{spec.gem_dir}/lib/tasks/*.rake").each { |r| load r }

LANGS = %w[en ar].freeze
SITE  = WaxTasks::TaskRunner.new.site
DIR   = [SITE[:source_dir], '_data'].compact.join('/')

task :lint do
  ARGS = ARGV.drop(1).each { |a| task a.to_sym }
  raise 'You must specify a collection after rake process' if ARGS.empty?

  ARGS.each do |a|
    path    = "#{DIR}/#{a}.csv"
    data    = ingest(path)
    pids    = data.map { |d| d.fetch('pid', nil) }.compact
    langs   = data.map { |d| d['language'].strip }.uniq
    orphans = frequency(pids).find_all { |p| p[1] != 2 }
    
    raise "Misconfigured languages. Found #{langs}, expected #{LANGS}".magenta unless langs == LANGS
    raise "The following PIDs are orphaned: #{orphans}".magenta unless orphans.empty?
    raise 'Not all records contain a valid PID value'.magenta unless data.length == pids.length

    puts "Passes ✓".green
  end
end

# Custom Sudanphoto processing task
desc 'Split data, generate pages and regenerate lunr index'
task :process do
  ARGS = ARGV.drop(1).each { |a| task a.to_sym }
  raise 'You must specify a collection after rake process' if ARGS.empty?

  ARGS.each do |a|
    data  = ingest("#{DIR}/#{a}.csv")
    LANGS.each do |lang|
      path = "#{DIR}/#{a}-#{lang}.csv"
      split_data = data.find_all { |d| d['language'].strip == lang }
      write_csv(path, split_data)
      system("bundle exec rake wax:pagemaster #{a}/#{lang}")
      system("rm -r #{path}")
    end
  end
  Rake::Task['wax:lunr'].invoke
end

# Read in csv file as array of hashes
def ingest(src_file)
  CSV.read(src_file, headers: true, encoding: 'utf-8').map(&:to_hash)
rescue StandardError
  raise "Cannot load #{src_file}. Check for typos and rebuild.".magenta
end

# Write hash array to csv file
def write_csv(path, data)
  CSV.open(path, 'wb:UTF-8') do |csv|
    csv << data.first.keys
    data.each { |d| csv << d.values }
  end
rescue StandardError
  raise "Cannot write csv data to #{path} for some reason.".magenta
end

# construct frequency count for an array as 2d array
def frequency(array)
  array.each_with_object(Hash.new(0)) { |key, hash| hash[key] += 1 }
end

spec = Gem::Specification.find_by_name 'wax_tasks'
Dir.glob("#{spec.gem_dir}/lib/tasks/*.rake").each {|r| load r}

require 'csv'
require 'colorized_string'

desc "custom sudanphoto task to split csv by language ('en' or 'ar')"
task :csv_split do
  $argv = ARGV.drop(1)
  $argv.each { |a| task a.to_sym do ; end }
  if $argv.empty?
    puts "You must specify one or more csv data sources after 'bundle exec rake wax:csv_split'.".magenta
    exit 1
  else
    $argv.each do |a|
      name = File.basename( a, ".*" )
      src = "_data/" + name + ".csv"
      data = ingest(src)

      ar_path = "_data/" + name + "-ar.csv"
      en_path = "_data/" + name + "-en.csv"

      ar_data = data.find_all { |hash| hash['language'] == 'ar' }
      en_data = data.find_all { |hash| hash['language'] == 'en' }

      write_csv(ar_path,ar_data)
      write_csv(en_path,en_data)
    end
  end
end

def ingest(src)
  begin
    data = CSV.read(src, headers: true, encoding: "utf-8").map(&:to_hash)
    puts ("\nProcessing " + src + "....\n").cyan
    data.first.keys.each do |key|
      return data
    end
  rescue
    puts ("Cannot load " + src + ". check for typos and rebuild.").magenta
    exit 1
  end
end

def write_csv(path, data)
  begin
    CSV.open(path, 'wb:UTF-8') do |csv|
      csv << data.first.keys
      data.each do |hash|
        csv << hash.values
      end
    end
    puts ("Writing csv data to " + path + ".").green
  rescue
    raise ("Cannot write csv data to "+  path + " for some reason.").magenta
  end
end

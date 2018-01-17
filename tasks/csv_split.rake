require 'faker'
require 'csv'

task :fake_data do
  Dir.mkdir('_data') unless File.exists?('_data')
  collection_names = []
  3.times do # 3 csv files
    csv = []
    headers = ['pid','title']
    5.times { headers << slug(Faker::Witcher.unique.monster)} # with 5 custom headers
    7.times do # with 7 rows
      row = {}
      row[headers[0]] = slug(Faker::Lovecraft.unique.word)
      row[headers[1]] = Faker::Lorem.sentence
      row[headers[2]] = Faker::TwinPeaks.quote
      Faker::Config.locale = 'fa'
      row[headers[3]] = Faker::Name.name
      Faker::Config.locale = 'ru'
      row[headers[4]] = Faker::Commerce.product_name
      row[headers[5]] = Faker::File.file_name
      row[headers[6]] = Faker::Lovecraft.sentence
      csv << row
    end
    name = slug(Faker::Witcher.unique.monster)
    path = '_data/' + name + '.csv'
    write_csv(path, csv)
    collection_names << name
    Faker::Dune.unique.clear
    Faker::Lovecraft.unique.clear
  end
  $argv = collection_names
  Rake::Task['wax:config'].invoke
  Rake::Task['wax:pagemaster'].invoke
  Rake::Task['wax:lunr'].invoke
end

def slug(str)
  return str.downcase.gsub(' ', '_').gsub(/[^\w-]/, '')
end

def write_csv(path, data)
  begin
    CSV.open(path, 'wb:UTF-8') do |csv|
      csv << data.first.keys
      data.each do |hash|
        csv << hash.values
      end
    end
    puts ("Writing csv data to " + path + ".")
  rescue
    raise ("Cannot write csv data to "+  path + " for some reason.")
  end
end

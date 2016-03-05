require 'csv'

namespace :seed_data do
  desc "Import calentadores"
  task urusec_from_csv: :environment do
    import_csv('ursea-calentadores-agua.csv') do |row|
      p = Product.new(
        brand: row[0].split(' ').map{ |a| a.capitalize }.join(' '),
        model: row[1],
        description: row[2],
        kwatts_hour: row[7],
        efficiency_class: row[5],
        litres: row[6]
      )
      p.save
      puts "Imported #{p.brand} - #{p.model} - #{p.description}"
    end
  end
end

def import_csv(file)
  options = { headers: true }
  CSV.foreach(File.join(Rails.root, 'lib/data/', file), options) do |row|
    yield row
  end
end

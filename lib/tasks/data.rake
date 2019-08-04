namespace :data do
  desc "Import languages from a CSV"
  task import_languages: :environment do
    csv_path = ARGV[1]
    table = CSV.read(csv_path, headers: true)
    table.each do |l|
      language = Language.new(name: l["Language"], name_cn: l["Name CN"], period: l["Period"])  
      if l["Parent"]
        parent = Language.where(name: l["Parent"]).first
        language.parent = parent
      end
      language.save
    end
  end
end

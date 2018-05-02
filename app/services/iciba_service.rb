require 'open-uri'

class IcibaService
  ENDPOINT = 'http://dict-co.iciba.com/api/dictionary.php'
  SECRET_KEY = ENV['iciba_secret_key']

  def self.query(word)
    uri = "#{ENDPOINT}?type=json&key=#{SECRET_KEY}&w=#{word}"
    result = JSON.parse(open(uri).read, object_class: OpenStruct)

    if meanings = result.symbols[0].parts
      meanings.map{|entry| [entry.part, entry.means.join('；') ].join(' ')}.join("\n")
    else
      nil
    end
  end
end

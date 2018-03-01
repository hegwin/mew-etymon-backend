class Etymon < ApplicationRecord
  has_and_belongs_to_many :words

  attr_accessor :words_string

  def words_string
    words.map(&:spelling).join(',')
  end

  def words_string=(string)
    self.words.clear
    string.split(',').each do |spelling|
      word = Word.find_or_create_by(spelling: spelling)
      words << word
    end
  end
end

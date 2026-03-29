class Word < ApplicationRecord
  has_and_belongs_to_many :etymons

  after_save :query_word_meaning, if: -> { meaning.blank? }

  def etymons_string
    etymons.map(&:spelling).join(',')
  end

  def query_meaning!(dict = IcibaService)
    meaning = dict.query(spelling&.strip)
    return nil if meaning.nil?

    update meaning: meaning
  end

  private

  def query_word_meaning
    QueryWordJob.perform_later(id)
  end
end

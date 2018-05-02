class Word < ApplicationRecord
  has_and_belongs_to_many :etymons

  after_create :query_word_meaning, unless: :meaning

  def etymons_string
    etymons.map(&:spelling).join(',')
  end

  def query_word_meaning
    QueryWordJob.perform_later(id, IcibaService)
  end
end

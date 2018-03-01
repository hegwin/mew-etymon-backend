class Word < ApplicationRecord
  has_and_belongs_to_many :etymons

  def etymons_string
    etymons.map(&:spelling).join(',')
  end
end

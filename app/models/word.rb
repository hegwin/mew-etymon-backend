class Word < ApplicationRecord
  has_and_belongs_to_many :etymons
end

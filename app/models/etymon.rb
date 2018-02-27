class Etymon < ApplicationRecord
  has_and_belongs_to_many :words
end

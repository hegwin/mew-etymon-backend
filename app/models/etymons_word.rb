class EtymonsWord < ApplicationRecord
  belongs_to :etymon
  belongs_to :word
end

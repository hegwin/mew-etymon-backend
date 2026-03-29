class Language < ApplicationRecord
  acts_as_nested_set

  validates :name, presence: true, uniqueness: true
end

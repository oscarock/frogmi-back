class Comment < ApplicationRecord
  #relations
  belongs_to :feature

  #validations
  validates :body, presence: true
end

class Feature < ApplicationRecord

  #relations
  has_many :comments, dependent: :destroy
end

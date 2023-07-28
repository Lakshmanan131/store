class College < ApplicationRecord
  validates :name , presence: true , uniqueness: true
  validates :location , presence: true
  has_many :students, dependent: :destroy  #add has many
end

class RegisteredApplication < ApplicationRecord
  belongs_to :user
  validates :name,
            length: { minimum: 1, maximum: 100 },
            presence: true,
            uniqueness: true
  validates :url,
            length: { minimum: 1, maximum: 100 },
            presence: true,
            uniqueness: true 

end

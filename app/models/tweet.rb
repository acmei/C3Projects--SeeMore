class Tweet < ActiveRecord::Base
  # Associations ----------------------------------------------
  has_and_belongs_to_many :users

  # Validations ----------------------------------------------
  validates :username, :provider_id, presence: true, uniqueness: true
end
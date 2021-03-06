require 'httparty'

class Instagram < ActiveRecord::Base
  # Associations ----------------------------------------------
  has_and_belongs_to_many :users, uniq: true
  has_many :instagram_posts

  # Validations ----------------------------------------------
  validates :username, :provider_id, presence: true, uniqueness: true


end

class Rsvp < ActiveRecord::Base
  has_many :meetups
  has_many :users
end

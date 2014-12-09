class Topic < ActiveRecord::Base
  has_many :meetups
end

class TopicsOfInterest < ApplicationRecord
  has_many :users_interests
  has_many :users, through: :users_interests
  validates_presence_of :topic_name
end

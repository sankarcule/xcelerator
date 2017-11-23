class UsersInterest < ApplicationRecord
  belongs_to :user
  belongs_to :topics_of_interest
end

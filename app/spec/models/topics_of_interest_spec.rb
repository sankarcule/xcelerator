require 'rails_helper'

RSpec.describe TopicsOfInterest, type: :model do
  it { should have_many(:users_interests) }
  it { should have_many(:users) }

  it { should validate_presence_of(:topic_name) }
end

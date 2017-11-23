require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_many(:users_interests) }
  it { should have_many(:topics_of_interests) }
  it { should have_many(:api_keys) }

  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password) }
end

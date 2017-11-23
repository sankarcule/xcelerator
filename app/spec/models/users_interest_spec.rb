require 'rails_helper'

RSpec.describe UsersInterest, type: :model do
  it { should belong_to(:topics_of_interest) }
  it { should belong_to(:user) }
end

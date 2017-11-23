require 'rails_helper'

RSpec.describe ApiKey, type: :model do
  it { should belong_to(:user) }
  it { should validate_presence_of(:token) }

end

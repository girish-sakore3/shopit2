require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:number) }
    it { should validate_presence_of(:address) }
    it { should validate_uniqueness_of(:email)}
  end
end

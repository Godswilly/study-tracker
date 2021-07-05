require 'rails_helper'

RSpec.describe Study, type: :model do
  describe 'associations' do
    it { should belong_to(:user) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:hours) }
    it { should validate_presence_of(:hours_goal) }
    it { should validate_presence_of(:projects) }
    it { should validate_presence_of(:projects_goal) }
  end
end

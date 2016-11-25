require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is valid with valid attributes' do
    expect(FactoryGirl.build(:user)).to be_valid
  end

  it 'is invalid wihout a role' do
    expect(FactoryGirl.build(:user, role: nil)).not_to be_valid
  end
end

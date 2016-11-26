require 'rails_helper'
require 'cancan/matchers'

RSpec.describe User, type: :model do
  subject(:ability) do
    Ability.new(user)
  end

  context 'as an admin' do
    let(:user) do
      FactoryGirl.create(:user, role: :admin)
    end

    it 'can manage users' do
      is_expected.to be_able_to(:manage, User.new)
    end

    it 'can manage game queues' do
      is_expected.to be_able_to(:manage, GameQueue.new)
    end
  end

  context 'as a player' do
    let(:user) do
      FactoryGirl.create(:user, role: :player)
    end

    it 'can read users' do
      is_expected.to be_able_to(:read, User.new)
    end

    it 'can reset their own token' do
      is_expected.to be_able_to(:reset_token, user)
    end

    it 'cannot reset tokens that are not their own' do
      is_expected.not_to be_able_to(:reset_token, User.new)
    end
  end
end

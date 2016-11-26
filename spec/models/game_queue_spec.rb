require 'rails_helper'

RSpec.describe GameQueue, type: :model do
  it 'is valid with valid attributes' do
    expect(FactoryGirl.build(:game_queue)).to be_valid
  end

  it 'is invalid wihout a name' do
    expect(FactoryGirl.build(:game_queue, name: nil)).not_to be_valid
  end

  it 'is invalid with a name under 3 characters' do
    expect(FactoryGirl.build(:game_queue, name: 'aa')).not_to be_valid
  end

  it 'is invalid with a name over 64 characters' do
    expect(FactoryGirl.build(:game_queue, name: 'a' * 65)).not_to be_valid
  end

  it 'is invalid without a description' do
    expect(FactoryGirl.build(:game_queue, description: nil)).not_to be_valid
  end

  it 'is invalid with a description over 128 characters' do
    expect(FactoryGirl.build(:game_queue, description: 'a' * 129)).not_to be_valid
  end

  it 'is invalid without a forum id' do
    expect(FactoryGirl.build(:game_queue, forum_id: nil)).not_to be_valid
  end

  it 'is invalid with a duplicate forum id' do
    FactoryGirl.create(:game_queue, forum_id: 1)
    expect(FactoryGirl.build(:game_queue, forum_id: 1)).not_to be_valid
  end
end

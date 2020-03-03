require 'rails_helper'

RSpec.describe Character, type: :model do
  it { should belong_to :user }

  it { should validate_presence_of :name }

  describe '#creator?' do
    let(:user) { create(:user) }
    let(:user2) { create(:user) }
    let(:character) { create(:character, user: user) }

    context "User is character's creator" do
      it 'returns true' do
        expect(character).to be_creator(user)
      end
    end

    context "User is NOT character's creator" do
      it 'returns false' do
        expect(character).to_not be_creator(user2)
      end
    end
  end
end

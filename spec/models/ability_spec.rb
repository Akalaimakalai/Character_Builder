require 'rails_helper'

RSpec.describe Character do

  subject(:ability) { Ability.new(user) }

  describe "for guest" do
    let(:user) { nil }
    it { should_not be_able_to :manage, :all }
  end

  describe "for user" do
    let(:user) { create(:user) }
    let(:user_character) { build(:character, user: user) }
    let(:another_character) { create(:character) }

    context "Character" do
      it { should be_able_to :create, user_character }

      it { should be_able_to :destroy, user_character }
      it { should_not be_able_to :destroy, another_character }
    end
  end
end

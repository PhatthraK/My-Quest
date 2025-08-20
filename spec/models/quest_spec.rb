require 'rails_helper'

RSpec.describe Quest, type: :model do
  it "is valid with a description" do
    quest = Quest.new(description: "Test Quest")
    expect(quest).to be_valid
  end

  it "is invalid without a description" do
    quest = Quest.new(description: nil)
    expect(quest).not_to be_valid
  end
end

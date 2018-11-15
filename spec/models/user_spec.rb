require 'rails_helper'

describe User do
  context "when new user created" do

    let(:user) { FactoryBot.create(:user)}

    it "is is valid with username and password" do
      expect(user).to be_valid
    end

    it "is not valid without an email" do
      expect(User.new(password: "aaaaaa")).not_to be_valid
    end
    it "is not valid without a six character password" do
      expect(User.new(password: "aaaaaa")).not_to be_valid
    end
  end
end

describe User, type: :model do
  it "should not validate users without an email address" do
    @user = FactoryBot.build(:user, email: "not_an_email")
    expect(@user).to_not be_valid
  end
end

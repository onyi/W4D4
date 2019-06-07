require 'rails_helper'

RSpec.describe User, type: :model do

  describe "Validations" do 
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:user_name) }
    it { should validate_length_of(:password).is_at_least(6) }
  end

  it "should fail when password is less than 6 characters long" do 
    
  end


end

RSpec.describe User do

  let(:user1) { User.new(username: "helloworld", password: "password", email: "hello@world.com") }

  describe "::find_by_credentials" do
    it "should able to find a User model when the correct username and password has passed in" do
      let(:user2) { User.find_by_credentials("helloworld", "password") }
      expect(user2.username).to eq(user1.username)
    end
  end

  describe "#reset_session_token!" do
    it "should generates a new session token for current user" do
      let(:old_session_token) { user1.session_token }
      user1.reset_session_token!
      expect(user1.session_token).to_not eq(old_session_token)
    end
  end

  describe "#is_password?" do
    
    it "should return true when user entered the same password when login" do
      user1.is_password?("helloworld").should be_true
    end
  end
end
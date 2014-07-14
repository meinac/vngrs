require 'spec_helper'

describe User do

  before(:all) do
    @user = FactoryGirl.create(:user)
  end

  context 'non-specific tests' do
    it { should have_many(:contacts) }
    it { should validate_presence_of(:user_name) }
    it { should validate_uniqueness_of(:user_name) }
    it { should validate_uniqueness_of(:email) }
    it { should ensure_length_of(:user_name).is_at_least(4).is_at_most(50) }
  end

  context 'find_for_database_authentication method' do
    it 'should find the user according to email' do
      user = User.find_for_database_authentication(email: @user.user_name)
      user.should eql(@user)
    end
    it 'should find the user according to user_name' do
      user = User.find_for_database_authentication(email: @user.email)
      user.should eql(@user)
    end
    it 'should not find the user if there are any record with given user_name or email' do
      user = User.find_for_database_authentication(email: "abidik@gubidik.com")
      user.should eql(nil)
    end
  end

end

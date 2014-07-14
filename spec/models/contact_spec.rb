require 'spec_helper'

describe Contact do

  context 'non-specific tests' do
    it { should belong_to(:user) }
    it { should validate_presence_of(:user_id) }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_numericality_of(:user_id) }
    it { should validate_uniqueness_of(:email) }
    it { should validate_uniqueness_of(:phone) }
    it { should ensure_length_of(:name).is_at_least(3).is_at_most(100) }
    it { should ensure_length_of(:last_name).is_at_least(3).is_at_most(100) }
    it { should ensure_length_of(:email).is_at_least(4).is_at_most(100) }
    it { should ensure_length_of(:phone).is_at_least(7).is_at_most(20) }
  end

end

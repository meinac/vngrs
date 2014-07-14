class User < ActiveRecord::Base

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  validates_presence_of :user_name

  validates_uniqueness_of :user_name, :case_sensitive => false

  validates_length_of :user_name, :minimum => 4, :maximum => 50, :unless => Proc.new{|u| u.user_name.blank?}

  protected
  def self.find_for_database_authentication(conditions)
    value = conditions[authentication_keys.first]
    where(["user_name = :value OR email = :value", { value: value }]).first
  end

end

class Contact < ActiveRecord::Base

  belongs_to :user

  validates_presence_of :user_id
  validates_presence_of :name
  validates_presence_of :last_name

  validates_numericality_of :user_id, if: Proc.new{|c| c.user_id.present?}

  validates_length_of :name, minimum: 3, maximum: 100, if: Proc.new{|c| c.name.present?}
  validates_length_of :last_name, minimum: 3, maximum: 100, if: Proc.new{|c| c.last_name.present?}
  validates_length_of :email, minimum: 4, maximum: 100, if: Proc.new{|c| c.email.present?}
  validates_length_of :phone, minimum: 7, maximum: 20, if: Proc.new{|c| c.phone.present?}

  validates_uniqueness_of :email, if: Proc.new{|c| c.email.present?}
  validates_uniqueness_of :phone, if: Proc.new{|c| c.phone.present?}

end

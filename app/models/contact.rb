class Contact < ActiveRecord::Base

  belongs_to :user

  validates_presence_of :user_id
  validates_presence_of :name
  validates_presence_of :last_name

  validates_numericality_of :user_id, if: Proc.new{|c| c.user_id.present?}

  validates_length_of :name, minimum: 4, maximum: 100, if: Proc.new{|c| c.name.present?}
  validates_length_of :last_name, minimum: 4, maximum: 100, if: Proc.new{|c| c.last_name.present?}

end

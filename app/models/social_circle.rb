class SocialCircle < ActiveRecord::Base
  attr_accessible :name

  validates :name, :presence => true

  has_many :memberships,
           :class_name => "SocialCircleMembership",
           :primary_key => :id,
           :foreign_key => :circle_id
end

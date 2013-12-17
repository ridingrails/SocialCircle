class SocialCircleMembership < ActiveRecord::Base
  attr_accessible :circle_id, :user_id

  validates :circle, :user

  belongs_to :circle,
             :class_name => "SocialCircle",
             :primary_key => :id,
             :foreign_key => :circle_id

  belongs_to :user
end

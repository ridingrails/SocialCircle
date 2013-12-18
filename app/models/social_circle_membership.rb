class SocialCircleMembership < ActiveRecord::Base
  attr_accessible :circle_id, :user_id

  validates_presence_of :circle_id, :user_id

  belongs_to :circle,
             :class_name => "SocialCircle",
             :primary_key => :id,
             :foreign_key => :circle_id

  belongs_to :user
end

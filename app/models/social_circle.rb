class SocialCircle < ActiveRecord::Base
  attr_accessible :name, :member_ids, :post_ids

  validates :name, :presence => true

  has_many :memberships,
           :class_name => "SocialCircleMembership",
           :primary_key => :id,
           :foreign_key => :circle_id

  has_many :members,
           :through => :memberships,
           :source => :user

  has_many :posts,
           :through => :post_shares,
           :source => :post

  has_many :post_shares,
           :primary_key => :id,
           :foreign_key => :circle_id,
           :class_name => "PostShare"
end

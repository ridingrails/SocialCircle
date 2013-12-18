class PostShare < ActiveRecord::Base
  attr_accessible :circle_id, :post_id

  validates_presence_of :circle_id, :post_id

  belongs_to :circle,
             :primary_key => :id,
             :foreign_key => :circle_id,
             :class_name => "SocialCircle"

  belongs_to :post
end

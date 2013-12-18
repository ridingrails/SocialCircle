class Post < ActiveRecord::Base
  attr_accessible :user_id, :body, :circle_ids, :links_attributes

  validates_presence_of :user_id, :body

  belongs_to :user

  has_many :links, :inverse_of => :post

  has_many :circles, :through => :post_shares, :source => :circle

  has_many :post_shares

  accepts_nested_attributes_for :links
end

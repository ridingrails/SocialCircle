class Link < ActiveRecord::Base
  attr_accessible :post_id, :title, :url

  validates :title, :url, :post, :presence => true

  belongs_to :post
end



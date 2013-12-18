class User < ActiveRecord::Base
  attr_accessible :email, :token, :password, :circle_ids
  attr_reader :password

  before_validation :ensure_token

  validates :email, :password_digest, :presence => true

  has_many :memberships,
           :class_name => "SocialCircleMembership",
           :primary_key => :id,
           :foreign_key => :user_id

  has_many :circles,
           :through => :memberships,
           :source => :circle

  has_many :posts

  has_many :links,
           :through => :posts,
           :source => :links

  def self.generate_token
    SecureRandom.urlsafe_base64(16)
  end

  def reset_token!
    self.token = self.class.generate_token
    self.save!
    self.token
  end

  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def ensure_token
    self.token ||= self.class.generate_token
  end

  def self.find_by_credentials(email, password)
    user = User.find_by_email(email)
    return nil if user.nil?
    user.is_password?(password) ? user : nil
  end
end

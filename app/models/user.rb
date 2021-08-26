class User < ApplicationRecord
  before_save { self.email = email.downcase }
  validates :name, presence: true
  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
  validates :email, presence: true,
                    format: { with: EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  has_many :articles, dependent: :destroy
  has_many :active_relationships, class_name: 'Relationship',
                                  foreign_key: 'follower_id',
                                  dependent: :destroy
  has_many :followeds, through: :active_relationships

  #关注
  def follow(user)
    active_relationships.create(followed_id: user.id, follower_id: id)
  end

  #取消关注
  def unfollow(user)
    active_relationships.find_by(followed_id: user.id, follower_id: id).destroy
  end
end

class User < ApplicationRecord
    has_many :quoutes, dependent: :destroy
    has_many :active_relationships, class_name:  "Relationship",
    foreign_key: "follower_id",
    dependent:   :destroy
    has_many :passive_relationships, class_name:  "Relationship",
    foreign_key: "followed_id",
    dependent:   :destroy
    has_many :followers, through: :passive_relationships, source: :follower
    has_many :following, through: :active_relationships, source: :followed


    
    before_save { email.downcase! }
    validates :name, presence: true, length: { maximum: 50 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    validates :email, presence:   true,
                    format:     { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
    has_secure_password
    validates :password, presence: true, length: { minimum: 6 }, allow_nil: true

    def feed
        Quoute.where("user_id IN (:following_ids) OR user_id = :user_id",
        following_ids: following_ids, user_id: id)

    end

    def follow(other_user)
        active_relationships.create(followed_id: other_user.id)
      end
    
    def unfollow(other_user)
        active_relationships.find_by(followed_id: other_user.id).destroy
    end
    
    
    def following?(other_user)
        following.include?(other_user)
    end
end

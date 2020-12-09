class Tweet < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
  
  def self.search(search)
    return Tweet.all unless search
    Tweet.where(['body LIKE ?', "%#{search}%"])
  end
end

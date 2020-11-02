class Tweet < ApplicationRecord
	extend FriendlyId
  friendly_id :title, use: :slugged
  has_many :comments, as: :commentable
  has_many :retweets
  belongs_to :user
end

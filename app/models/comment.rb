class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates :content, :user, :post, presence: true
end

class Post < ApplicationRecord
  belongs_to :user

  #Validations
  validates :content, presence: true

  #Relationships
  has_many :comments

  #Constants
  QT_PROFILE = 4

  #Scopes
  scope :by_user , -> (id, page) { where(user_id: id).order(updated_at: :desc).page(page).per(QT_PROFILE) }
  scope :subscribed, -> (following, page) { where(user_id: following).order(created_at: :desc).page(page).per(QT_PROFILE)}
end

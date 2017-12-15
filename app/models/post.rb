class Post < ApplicationRecord
  belongs_to :user

  #Validations
  validates :content, presence: true

  #Constants
  QT_PROFILE = 4

  #Scopes
  scope :by_user , -> (id, page) { where(user_id: id).order(updated_at: :desc).page(page).per(QT_PROFILE) }

end

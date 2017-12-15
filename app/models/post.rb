class Post < ApplicationRecord
  belongs_to :user

  #Validations
  validates :content, presence: true
end

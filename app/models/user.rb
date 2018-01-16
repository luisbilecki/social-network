class User < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged
  mount_uploader :avatar, AvatarUploader

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Relationships
  has_many :posts
  has_many :following, :class_name => 'Follower', :foreign_key => 'current_id'

  # User Avatar Validation
  validates :avatar, presence: true
  validates_integrity_of  :avatar
  validates_processing_of :avatar

  # kaminari
  QTT_PER_PAGE = 5

  # scope
  scope :search, -> (q, page) {where("lower(name) LIKE ?", "%#{q.downcase}%"
                    ).page(page).per(QTT_PER_PAGE)}
  scope :filter_all, -> (page) {User.all.page(page).per(QTT_PER_PAGE)}

  private

  def avatar_size_validation
    errors[:avatar] << "should be less than 500KB" if avatar.size > 0.5.megabytes
  end

end

class User < ApplicationRecord
  extend FriendlyId

  friendly_id :username, use: :slugged

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: [:member, :editor, :admin]

  has_many :comments

  USERNAME_PATTERN = "[0-9A-Za-z][0-9A-Za-z-]{1,30}[0-9A-Za-z]".freeze

  validates :username, presence: true, uniqueness: true, format: /\A#{USERNAME_PATTERN}\z/
end

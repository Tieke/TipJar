class User < ActiveRecord::Base
  has_one :tipper
  has_many :tips, through: :tipper
  has_one :tippee
  has_many :tips, through: :tippee
  has_many :withdrawals
  has_many :deposits

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true
  validates :password, presence: true
end

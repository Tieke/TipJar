class User < ActiveRecord::Base
  has_one :tippee
  has_one :tipper
  has_many :withdrawals
  has_many :deposits
  has_many :follower_follows, class_name: 'Follow', foreign_key: :follower_id
  has_many :followings, through: :follower_follows
  has_many :following_follows, class_name: 'Follow', foreign_key: :following_id
  has_many :followers, through: :following_follows


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true
  validates :password, presence: true

  def increase_balance(amount)
    self.balance += amount
  end

  def decrease_balance(amount)
    self.balance -= amount
  end
end

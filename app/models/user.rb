class User < ActiveRecord::Base
  has_one :tippee
  has_one :tipper
  has_many :withdrawals
  has_many :deposits
  has_many :followed_follows, class_name: 'Follow', foreign_key: :followed_id
  has_many :followings, through: :followed_follows
  has_many :following_follows, class_name: 'Follow', foreign_key: :following_id
  has_many :followeds, through: :following_follows


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true
  validates :password, presence: true, length: {minimum: 5, maximum: 120}, on: :create
  validates :password, length: {minimum: 5, maximum: 120}, on: :update, allow_blank: true

  def increase_balance(amount)
    self.balance += amount
    self.save
  end

  def decrease_balance(amount)
    self.balance -= amount
    self.save
  end

end

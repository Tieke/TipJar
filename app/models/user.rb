class User < ActiveRecord::Base
  has_one :tippee
  has_one :tipper
  has_many :withdrawals
  has_many :deposits

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true
  validates :password, presence: true

  def increase_balance(amount)
    self.balance += amount
    self.save
  end

  def decrease_balance(amount)
    self.balance -= amount
    self.save
  end
 
end

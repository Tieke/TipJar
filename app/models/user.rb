class User < ActiveRecord::Base
  has_one :tippee
  has_one :tipper
  has_many :withdrawals
  has_many :deposits

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, omniauth_providers: [:coinbase]

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

  def self.find_for_oauth(auth)
    where(auth.slice(:provider, :uid)).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.name = auth.info.name
      user.create_credentials! :user => user, :credentials => auth.credentials
    end
  end
 
end

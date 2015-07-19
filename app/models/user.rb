class User < ActiveRecord::Base
  has_one :tippee
  has_one :tipper
  has_many :withdrawals
  has_many :deposits

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

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

  def paypal_url
    values = { 
      business: 'rhys_eda-facilitator@portegys.org',
      cmd: '_xclick',
      upload: 1,
      return: "http://localhost:3000/"
    }

    "https://www.sandbox.paypal.com/cgi-bin/webscr?" + values.to_query
 end 
 
end

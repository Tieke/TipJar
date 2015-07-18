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

 #  def paypal_url(return_url) 
 #    values = { 
 #    :business => 'xxxxxxxx@xxx.com',
 #        :cmd => '_cart',
 #    :upload => 1,
 #    :return => return_url,
 #    }   values.merge!({ 
 #    "amount_1" => unit_price,
 #    "item_name_1" => name,
 #    "item_number_1" => id,
 #    "quantity_1" => '1'
 #    })
 #         # For test transactions use this URL
 #    "https://www.sandbox.paypal.com/cgi-bin/webscr?" + values.to_query
 # end 
 
end

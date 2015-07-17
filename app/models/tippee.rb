class Tippee < ActiveRecord::Base
  belongs_to :user
  has_many :tips

  before_create :generate_tippee_token

  def generate_tippee_token
    self.tippee_token = SecureRandom.urlsafe_base64
  end
end

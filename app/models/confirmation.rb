class Confirmation < ActiveRecord::Base
	before_save { self.email = email.downcase }
	before_create :confirmation_token
	validates :name, presence: true, length: { maximum: 50 }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX, message: "e-mail deve ter @ e ponto(.)" },
                    uniqueness: { case_sensitive: false }
    validates :guets, length: { maximum: 3}
    validates :phone, length: { maximum: 20}
    validates :ip,length: { maximum: 20}
private
	def confirmation_token
	  if self.confirm_token.blank?
	      self.confirm_token = SecureRandom.urlsafe_base64.to_s
	  end
	end
end

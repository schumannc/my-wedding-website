class Message < ActiveRecord::Base
before_save { self.email = email.downcase }
validates :name, presence: true, length: { maximum: 50 }
VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
validates :email, presence: true, length: { maximum: 255 },
                format: { with: VALID_EMAIL_REGEX, message: "e-mail deve ter @ e ponto(.)" }
validates :text, length: { maximum: 250, message:"máximo 250 caracteres"}
	def self.first_four
		where(confirmation: true).limit(4)
	end
	def self.get_all
		where(confirmation: true).offset(4)
	end
end

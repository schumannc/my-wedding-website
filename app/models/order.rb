class Order < ActiveRecord::Base
  belongs_to :line_item
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
              format: { with: VALID_EMAIL_REGEX, message: "e-mail deve ter @ e ponto(.)" }
  validates :mensagem, length: { maximum: 3000, message:"máximo 3000 caracteres"}                  
end

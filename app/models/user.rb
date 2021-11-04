class User < ApplicationRecord
 
  belongs_to :city
  has_many :gossips
  has_many :sent_messages, foreign_key: 'sender_id', class_name: 'PrivateMessage'
  has_many :received_messages, foreign_key: 'recipient_id', class_name: 'PrivateMessage'
  has_many :comments
  has_many :likes

  has_secure_password    
  validates :password, :format => {with: /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[a-zA-Z]).{8,}$/, multiline: true}

  #Regex = 1minuscule 1 Majuscules 1 Nombres 1 CaracteresSpecial Entre8-10 caracteres 
end

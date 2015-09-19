class Administrator < ActiveRecord::Base




  #validation for name
  validates :name, presence: true, length: { maximum: 50 }


  #validation for email
  # VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 }
            # ,format: { with: /VALID_EMAIL_REGEX/ }







end

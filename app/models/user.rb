class User < ApplicationRecord
    has_secure_password
    has_many :posts, dependent: :destroy 
    has_many :collects, dependent: :destroy 

    validates :username, presence: true
    validates :email, presence: true
    validates :password, presence:true, :confirmation =>true

    #validates_confirmation_of :password
end

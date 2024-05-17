class User < ApplicationRecord
    has_secure_password
    has_one :otp
    has_many :carts

    has_one_attached :photo

    validates :email, presence: true, uniqueness: true
    validates :name, :address, :presence => true
    validates :password, length: { minimum: 6 }, :on => :create
    validates :number, format: { with: /\A\d{10,12}\z/, message: 'invalid phone number'}
    
    enum status: %i[ unverified active suspended ], _default: 0

end
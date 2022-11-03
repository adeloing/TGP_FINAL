class User < ApplicationRecord
    has_many :gossips

    belongs_to :city
    has_secure_password
    validates :password, presence: true, length: {minimum: 6}  
end

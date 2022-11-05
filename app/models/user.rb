class User < ApplicationRecord
    has_many :gossips

    belongs_to :city
    has_secure_password
    validates :password, presence: true, length: {minimum: 6}

    def remember(remember_token)
        remember_digest = BCrypt::Password.create(remember_token)
        self.update(remember_digest: remember_digest)
    end
end

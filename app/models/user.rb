class User < ApplicationRecord
    has_many :messages
    validates :username, uniqueness: { case_sensitive: false },  presence: true, length: {minimum: 3, maximum: 20}
    has_secure_password
end

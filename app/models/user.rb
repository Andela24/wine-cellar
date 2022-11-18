class User < ApplicationRecord
    has_secure_password

    validates :username, presence: true, uniqueness: true
    validates :password, presence: true

    has_many :bottles
    has_many :wineries, -> { distinct }, through: :bottles
end

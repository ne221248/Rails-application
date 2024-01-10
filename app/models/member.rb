class Member < ApplicationRecord
    has_secure_password

    has_many :orders
    has_one :cart


    attr_accessor :current_password
    validates :password, presence: { if: :current_password }
end

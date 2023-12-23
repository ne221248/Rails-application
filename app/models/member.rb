class Member < ApplicationRecord
    has_many :orders
    has_one :cart
end

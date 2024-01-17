class Order < ApplicationRecord
    belongs_to :member
    has_many :configurations, dependent: :destroy
end

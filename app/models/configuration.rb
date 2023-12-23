class Configuration < ApplicationRecord
    belongs_to :cart
    belongs_to :plan
    belongs_to :part
    belongs_to :order
end

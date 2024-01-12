class Configuration < ApplicationRecord
    belongs_to :cart, optional: true
    belongs_to :plan
    belongs_to :part
    belongs_to :order, optional: true
end

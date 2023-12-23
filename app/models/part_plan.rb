class PartPlan < ApplicationRecord
    belongs_to :plan
    belongs_to :part
end

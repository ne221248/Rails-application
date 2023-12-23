class Part < ApplicationRecord
    belongs_to :part_type
    has_many :part_plans
    has_many :configurations
end

class Plan < ApplicationRecord
    has_many :configurations
    has_many :part_plans
end

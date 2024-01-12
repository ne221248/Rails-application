class Cart < ApplicationRecord
    belongs_to :member
    has_many :configurations

    class << self
        def save_configurations(configurations)
            configurations.each do |configuration|
                configuration.save
            end
        end
    end
end

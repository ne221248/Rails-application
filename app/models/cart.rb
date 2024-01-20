class Cart < ApplicationRecord
    belongs_to :member
    has_many :configurations, dependent: :destroy

    attr_accessor :cpu
    attr_accessor :gpu
    attr_accessor :os
    attr_accessor :motherboard
    attr_accessor :ram
    attr_accessor :storage
    attr_accessor :power
    attr_accessor :box
    attr_accessor :cool
    attr_accessor :drive

end

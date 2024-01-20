class Plan < ApplicationRecord
    has_many :configurations
    has_many :part_plans
    has_many :parts, through: :part_plans

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

    validates :name, presence: true, uniqueness: true
    validates :description, presence: true
    validates :usertype, presence: true

    validates :cpu, presence: true
    validates :gpu, presence: true
    validates :os, presence: true
    validates :motherboard, presence: true
    validates :ram, presence: true
    validates :storage, presence: true
    validates :power, presence: true
    validates :box, presence: true
    validates :cool, presence: true
    validates :drive, presence: true


    class << self
        def search(q1, q2, q3)
            plans = all
            parts1 = Part.where(name: q1)
            parts2 = Part.where(name: q2)
            if q1 != "指定なし" && q2 != "指定なし"
                plans = plans.joins(:parts)
                         .where("parts.id IN (?)", parts1.pluck(:id))
                         .where("plans.id IN (?)", joins(:parts).where("parts.id IN (?)", parts2.pluck(:id)).pluck(:id))
            else
                plans = plans.joins(:parts).where(parts: { id: parts1.pluck(:id) }) if q1 != "指定なし"
                plans = plans.joins(:parts).where(parts: { id: parts2.pluck(:id) }) if q2 != "指定なし"
            end
            plans = plans.where(usertype: query3) if q3 != "指定なし"
            plans #絞り込んだ条件のplanを返す
        end
    end
end

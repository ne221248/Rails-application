class Part < ApplicationRecord
    belongs_to :part_type
    has_many :part_plans
    has_many :plans, through: :part_plans
    has_many :configurations

    validates :name, presence: true, uniqueness: true
    validates :inventory, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
    validates :price, presence: true
    


    class << self
        def serch(parttype, zaiko)
            rel = order("id")
            if (parttype != "指定なし")
                if parttype == "CPU"
                    rel = rel.where("part_type_id == 1")
                elsif parttype == "OS"
                    rel = rel.where("part_type_id == 2")
                elsif parttype == "GPU"
                    rel = rel.where("part_type_id == 3")
                elsif parttype == "メモリ"
                    rel = rel.where("part_type_id == 4")
                elsif parttype == "ケース"
                    rel = rel.where("part_type_id == 5")
                elsif parttype == "ストレージ"
                    rel = rel.where("part_type_id == 6")
                elsif parttype == "マザーボード"
                    rel = rel.where("part_type_id == 7")
                elsif parttype == "冷却機"
                    rel = rel.where("part_type_id == 8")
                elsif parttype == "電源"
                    rel = rel.where("part_type_id == 9")
                elsif parttype == "光学ドライブ"
                    rel = rel.where("part_type_id == 10")
                end
            end
            if (zaiko != "指定なし")
                rel = rel.where(inventory: zaiko)
            end
            rel
        end
    end
end

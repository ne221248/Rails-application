class Plan < ApplicationRecord
    has_many :configurations
    has_many :part_plans
    has_many :parts, through: :part_plans

    class << self
        def serch(query, usertype)
            rel = order("id")
            if (query != "指定なし")
                if query == "10万~20万"
                    rel = rel.where("price >= 100000 AND price < 200000")
                elsif query == "20万~30万"
                    rel = rel.where("price >= 200000 AND price < 300000")
                elsif query == "30万~"
                    rel = rel.where("price >= 300000")
                end
            end
            if (usertype != "指定なし")
                rel = rel.where(usertype: usertype)
            end
            rel
        end
    end
end

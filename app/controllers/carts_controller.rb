class CartsController < ApplicationController

    def index 
    end

    def show
    end

    def edit # パーツ変更をする際に呼び出されるアクション

        # Configuration.find_by(cart_id: parans[:id])が存在するかどうかで条件分岐
        # 前処理
        @cart = Cart.find_by(member_id: #current_member)
        plan = Plan.find_by(id: params[:plan_id])
        part_plans = PartPlan.where(plan_id: plan.id)
        my_objects = []
        array = []
        part_plans.each_with_index do |part_plan, idx|
            array[idx] = part_plan.part_id
        end
        array.each do |id|
            my_objects << Part.find_by(id: id)
        end
        @parts = my_objects

        # configurationの作成
        @parts.each do |part|
            @configuration = configuration.create(
                plan_id: plan.id,
                part_id: part.id,
                cart_id: @cart.id,
                order_id:
            )
        end
    end

    def update

    end

end

class PlansController < ApplicationController

    def index #プラン一覧表示
        @plans = Plan.order(price: :asc).all #金額順に並び替え
    end

    def show #プラン詳細表示
        @plan = Plan.find_by(id: params[:id])
        part_plans = PartPlan.where(plan_id: @plan.id)

        my_objects = []
        array = []
        part_plans.each_with_index do |part_plan, idx|
            array[idx] = part_plan.part_id
        end
        array.each do |id|
            my_objects << Part.find_by(id: id)
        end
        @parts = my_objects
    end

    def search
        @plans = Plan.serch(params[:q], params[:u])
        render "index"
    end
end

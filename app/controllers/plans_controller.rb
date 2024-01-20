class PlansController < ApplicationController

    def index #プラン一覧表示
        @plans = Plan.order("id") 
        @cpu_names = Part.joins(:part_type).where(part_types: { kind: 'CPU' }).pluck(:name)
        @cpu_names.unshift("指定なし")
        @gpu_names = Part.joins(:part_type).where(part_types: { kind: 'GPU' }).pluck(:name)
        @gpu_names.unshift("指定なし")
    end

    def show #プラン詳細表示
        @plan = Plan.find_by(id: params[:id])
        @parts = @plan.parts
        @plan.sale = true
        # 在庫がないpartを保有するplanの場合、saleをfalseにする
        @parts.each do |part|
            @plan.sale = false if part.inventory == 0
        end
    end

    def search
        @plans = Plan.search(params[:q1], params[:q2], params[:q3])
        @cpu_names = Part.joins(:part_type).where(part_types: { kind: 'CPU' }).pluck(:name)
        @cpu_names.unshift("指定なし")
        @gpu_names = Part.joins(:part_type).where(part_types: { kind: 'GPU' }).pluck(:name)
        @gpu_names.unshift("指定なし")
        render "index"
    end
end

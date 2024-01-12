class Admin::PlansController < Admin::Base

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

    #以下、管理者のみ権限を所有する

    def edit #プランの変更
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

    def update #プランの更新(PartPlanクラスについてもやるべき)
        @plan = Plan.find_by(id: params[:id])
        @plan.assign_attributes(params[:plan])
        if @plan.save
            redirect_to [:admin, @plan], notice: "プランの情報を更新しました"
        else
            render "edit"
        end
    end

    def new #プランの新規作成
        @plan = Plan.new
    end

    def create
        @plan = Plan.new(params[:plan])
        if @plan.save
            redirect_to [:admin, @plan], notice: "プランの情報を更新しました"
        else
            render "edit"
        end
    end

    def destroy
        @plan = Plan.find_by(id: params[:id])
        @plan.destroy
        redirect_to [:admin, @plan], notice: "プランを削除しました"
    end

end

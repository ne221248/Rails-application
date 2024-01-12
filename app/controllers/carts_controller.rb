class CartsController < ApplicationController
    before_action :login_required

    def show
        member = current_member
        @cart = Cart.find_by(member_id: member.id)
        @configurations = @cart.configurations
        #@plan = Plan.find_by(id: @configurations.plan_id)
        my_objects = []
        array = []
        @configurations.each_with_index do |configuration, idx|
            array[idx] = configuration.part_id
        end
        array.each do |id|
            my_objects << Part.find_by(id: id)
        end
        @parts = my_objects   
    end

    def edit # パーツ変更をする際に呼び出されるアクション
        # パラメータが存在するかどうかで条件分岐
        if params[:plan_id].present?

            # 前処理
            member = current_member
            @cart = Cart.find_by(member_id: member.id)
            @plan = Plan.find_by(id: params[:plan_id])
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

            # configurationの作成
            my_objects2 = []
            @parts.each_with_index do |part, idx|
                my_objects2[idx] = @cart.configurations.build(
                plan_id: @plan.id,
                part_id: part.id,
                )
            end
            @configurations = my_objects2
        else

            member = current_member
            @cart = Cart.find_by(id: params[:id])
            @configurations = @cart.configuration
            @plan = Plan.find_by(id: @configurations.plan_id)
            my_objects = []
            array = []
            @configurations.each_with_index do |configuration, idx|
                array[idx] = configuration.part_id
            end
            array.each do |id|
                my_objects << Part.find_by(id: id)
            end
            @parts = my_objects
        end
    end

    def update

    end

    def new
        # 前処理
        member = current_member
        @cart = Cart.find_by(member_id: member.id)
        @plan = Plan.find_by(id: params[:plan_id])
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

        # configurationの作成
        my_objects2 = []
        @parts.each_with_index do |part, idx|
            my_objects2[idx] = @cart.configurations.build(
                plan_id: @plan.id,
                part_id: part.id,
            )
        end
        @configurations = my_objects2
        session[:configurations] = @configurations
    end

    def create
        p "テスト2"
        p session
        p "テスト23"
        p session[:configurations]
        member = current_member
        @cart = Cart.find_by(member_id: member.id)
        configurations = session[:configurations] 
        p configurations
        configurations.each do |configuration|
            p configuration["plan_id"]
            # Configuration モデルのインスタンスを生成
            config = @cart.configurations.build(
                part_id: configuration["part_id"],
                plan_id: configuration["plan_id"]
            )
            p "こんふぐ"
            p config
            # Configurationに追加
            p config.save
        end
      
            redirect_to cart_path, notice: "カートに追加しました" #flashにメッセージを入れて、/cartにリダイレクト

        

        
    end
end

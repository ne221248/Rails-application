class CartsController < ApplicationController
    before_action :login_required

    def show
        member = current_member
        @cart = Cart.find_by(member_id: member.id)
        if !(@cart.present?) # cartがもし、存在していなければ、新規作成する ex)cartのdestroyをした後など
            Cart.create(member_id: member.id)
            @cart = Cart.find_by(member_id: member.id)
        end
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
        member = current_member
        @cart = Cart.find_by(member_id: member.id)
        @configurations = @cart.configurations
        my_objects = []
        array = []
        @configurations.each_with_index do |configuration, idx|
            array[idx] = configuration.part_id
        end
        array.each do |id|
            my_objects << Part.find_by(id: id)
        end
        @parts = my_objects

        @parts.each do |part|
            if part.part_type_id == 1
                @cpu = part
            elsif part.part_type_id == 2
                @gpu = part
            elsif part.part_type_id == 4
                @motherboard = part
            elsif part.part_type_id == 3
                @os = part
            elsif part.part_type_id == 5
                @ram = part
            elsif part.part_type_id == 6
                @storage = part
            elsif part.part_type_id == 7
                @power = part
            elsif part.part_type_id == 8
                @box = part
            elsif part.part_type_id == 9
                @cool = part
            elsif part.part_type_id == 10
                @drive = part
            end
        end
    end

    def update
        member = current_member
        @cart = Cart.find_by(member_id: member.id)
        configurations = @cart.configurations
        configurations.each do |configuration|
            # Configuration モデルのインスタンスを生成
            part = configuration.part
            if part.part_type_id == 3
                configuration.assign_attributes(
                    part_id: params[:cart][:os],
                    cart_id: @cart.id
                )
            elsif part.part_type_id == 5
                configuration.assign_attributes(
                    part_id: params[:cart][:ram],
                    cart_id: @cart.id
                )
            elsif part.part_type_id == 6
                configuration.assign_attributes(
                    part_id: params[:cart][:storage],
                    cart_id: @cart.id
                )
            elsif part.part_type_id == 7
                configuration.assign_attributes(
                    part_id: params[:cart][:power],
                    cart_id: @cart.id
                )
            elsif part.part_type_id == 8
                configuration.assign_attributes(
                    part_id: params[:cart][:box],
                    cart_id: @cart.id
                )
            elsif part.part_type_id == 9
                configuration.assign_attributes(
                    part_id: params[:cart][:cool],
                    cart_id: @cart.id
                )
            elsif part.part_type_id == 10
                configuration.assign_attributes(
                    part_id: params[:cart][:drive],
                    cart_id: @cart.id
                )
            else
                configuration.assign_attributes(
                    part_id: part.id,
                    cart_id: @cart.id
                )
            end
            # Configurationに追加
            configuration.save
        end
        @configurations = @cart.configurations
        redirect_to cart_path, notice: "カートの内容を更新しました" #flashにメッセージを入れて、/cartにリダイレクト

    end

    def new
        member = current_member
        @cart = Cart.find_by(member_id: member.id)
        if !(@cart.present?) # cartがもし、存在していなければ、新規作成する ex)cartのdestroyをした後など
            Cart.create(member_id: member.id)
            @cart = Cart.find_by(member_id: member.id)
        end
        # すでにカートに存在している場合はカートに追加できないようにする
        if !(@cart.configurations.present?) # 存在しない場合
            # 前処理
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
        else
            redirect_to cart_path, notice: "既に別のプランがカートに追加されています" #flashにメッセージを入れて、/cartにリダイレクト
        end
    end

    def create
        member = current_member
        @cart = Cart.find_by(member_id: member.id)
        configurations = session[:configurations] 
        configurations.each do |configuration|
            # Configuration モデルのインスタンスを生成
            config = @cart.configurations.build(
                part_id: configuration["part_id"],
                plan_id: configuration["plan_id"]
            )
            # Configurationに追加
            config.save
        end
        @configurations = @cart.configurations
        redirect_to cart_path, notice: "カートに追加しました" #flashにメッセージを入れて、/cartにリダイレクト

    end

    def destroy
        member = current_member
        @cart = Cart.find_by(member_id: member.id)
        @cart.destroy
        redirect_to cart_path, notice: "カートを削除しました"
    end
end

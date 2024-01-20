class OrdersController < ApplicationController
    before_action :login_required

    def index 
        @member = current_member
        @orders = Order.where(member_id: @member.id)
    end

    def show
        @member = current_member
        @order = Order.find_by(id: params[:id])
        @configurations = @order.configurations
    end

    def new
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

        prices = @parts.map(&:price) # @partsのprice属性を配列として別の変数に格納
        # orderを作成
        @order = Order.new(
                member_id: member.id,
                amount: sum_prices(prices),
                status: "予約済み"
            )
        p "デバック用"
        p @order
        session[:order] = @order

    end

    def create

        member = current_member
        @cart = Cart.find_by(member_id: member.id)
        configurations = @cart.configurations
        array = []
        configurations.each_with_index do |configuration, idx|
            array[idx] = configuration.part_id
        end
        my_objects = []
        array.each do |id|
            my_objects << Part.find_by(id: id)
        end
        parts = my_objects

        flag = true
        # 在庫判定
        parts.each do |part|
            flag = false if part.inventory == 0
        end

        if flag == true
            order = session[:order]
            @order = Order.new(
                member_id: order["member_id"],
                amount: order["amount"],
                status: order["status"]
            )

            if @order.save
                # @configurationsのcart_idを削除し、@orderと関連付ける。
                configurations.each do |configuration|
                    configuration.assign_attributes(
                        cart_id: nil,
                        order_id: @order.id
                    )
                    # Configurationに追加
                    configuration.save
                end
                # @partsに格納
                @configurations = @order.configurations
                my_objects = []
                array = []
                @configurations.each_with_index do |configuration, idx|
                    array[idx] = configuration.part_id
                end
                array.each do |id|
                    my_objects << Part.find_by(id: id)
                end
                @parts = my_objects

                # 在庫を一つ減らす
                # 各configurationのpartを取得してinventoryを1減らす
                @configurations.each do |configuration|
                    part = configuration.part
                    part.update(inventory: part.inventory - 1)
                end

                redirect_to orders_path , notice: "予約を確定しました"

            else
                redirect_to :root, notice: "予期せぬエラーが発生しました"
            end

        else
            redirect_to :root, notice: "在庫がなくなり、予約できませんでした。"
        end

    end

    def destroy
        @order = Order.find_by(id: params[:id])
        @order.destroy
        redirect_to orders_path, notice: "予約を削除しました"
    end
    
end

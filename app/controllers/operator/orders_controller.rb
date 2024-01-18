class Operator::OrdersController < Operator::Base
    def index 
        @orders = Order.order("id")
    end

    def show
        @order = Order.find_by(id: params[:id])
        @member = Member.find_by(id: @order.member_id)
        @configurations = @order.configurations
    end

    def edit
        @order = Order.find_by(id: params[:id])
        @member = Member.find_by(id: @order.member_id)
    end

    def update
        @order = Order.find_by(id: params[:id])
        @member = Member.find_by(id: @order.member_id)
        @order.assign_attributes(params[:order])
        if @order.save
            redirect_to [:operator, @order], notice: "予約ステータスを更新しました"
        else
            render "edit"
        end
    end
end
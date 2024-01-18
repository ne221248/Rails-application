class Admin::OrdersController < Admin::Base

    def index 
        @orders = Order.order("id")
    end

    def show
        @order = Order.find_by(id: params[:id])
        @configurations = @order.configurations
    end

    def destroy
        @order = Order.find_by(id: params[:id])
        @order.destroy
        redirect_to [:admin, @order], notice: "予約を削除しました"
    end
    
end

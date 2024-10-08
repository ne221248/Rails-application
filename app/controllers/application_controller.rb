class ApplicationController < ActionController::Base
    before_action :update_expiration_time

    private def current_member
        # Member.find_by(id: session[:member_id]) if session[:member_id]
        Member.find_by(id: cookies.signed[:member_id]) if cookies.signed[:member_id]
    end
    helper_method :current_member

    private def current_admin
        Admin.find_by(id: cookies.signed[:admin_id]) if cookies.signed[:admin_id]
    end
    helper_method :current_admin

    private def current_operator
        Operator.find_by(id: cookies.signed[:operator_id]) if cookies.signed[:operator_id]
    end
    helper_method :current_operator

    private def sum_prices(prices) #パーツの合計金額を返すメソッド
        sum = 0
        prices.each do |price|
            sum += price
        end
        sum
    end

    class LoginRequired < StandardError; end
    class Forbidden < StandardError; end

    if Rails.env.production? || ENV["RESCUE_EXCEPTIONS"]
        rescue_from StandardError, with: :rescue_internal_server_error
        rescue_from ActiveRecord::RecordNotFound, with: :rescue_not_found
        rescue_from ActionController::ParameterMissing, with: :rescue_bad_request
    end
    
    rescue_from LoginRequired, with: :rescue_login_required
    rescue_from Forbidden, with: :rescue_forbidden

    private def login_required
        raise LoginRequired unless current_member
    end

    private def update_expiration_time  # クッキーに関するメソッド
        cookies.signed[:member_id] = { value: cookies.signed[:member_id], expires: 900.second.from_now} if cookies[:member_id] # 15→900に変更
    end

    private def update_admin_expiration_time  # クッキーに関するメソッド
        cookies.signed[:admin_id] = { value: cookies.signed[:admin_id], expires: 900.second.from_now} if cookies[:admin_id] # 15→900に変更
    end

    private def update_operator_expiration_time  # クッキーに関するメソッド
        cookies.signed[:operator_id] = { value: cookies.signed[:operator_id], expires: 900.second.from_now} if cookies[:operator_id] # 15→900に変更
    end

    private def rescue_bad_request(exception)
        render "errors/bad_request", status: 400, layout: "error",
            formats: [:html]
    end

    private def rescue_login_required(exception)
        render "errors/login_required", status: 403, layout: "error",
            formats: [:html]
    end

    private def rescue_forbidden(exception)
        render "errors/forbidden", status: 403, layout: "error",
            formats: [:html]
    end

    private def rescue_not_found(exception)
        render "errors/not_found", status: 404, layout: "error",
        formats: [:html]
    end

    private def rescue_internal_server_error(exception)
        render "errors/internal_server_error", status: 500, layout: "error",
            formats: [:html]
    end
end

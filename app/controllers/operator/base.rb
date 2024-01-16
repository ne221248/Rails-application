class Operator::Base < ApplicationController
    before_action :operator_login_required
    before_action :update_operator_expiration_time

    private def operator_login_required
        raise Forbidden unless current_operator
    end
end
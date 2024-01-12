class Operator::Base < ApplicationController
    before_action :operator_login_required

    private def operator_login_required
        raise Forbidden unless current_member.name == "operator"
    end
end
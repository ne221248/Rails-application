class Admin::Base < ApplicationController
    before_action :admin_login_required
    before_action :update_admin_expiration_time

    private def admin_login_required
        raise Forbidden unless current_admin
    end
end

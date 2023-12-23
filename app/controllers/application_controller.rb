class ApplicationController < ActionController::Base
    private def current_member
        # Member.find_by(id: session[:member_id]) if session[:member_id]
        Member.find_by(id: cookies.signed[:member_id]) if cookies.signed[:member_id]
    end
    helper_method :current_member

    
end

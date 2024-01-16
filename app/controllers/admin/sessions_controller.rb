class Admin::SessionsController < ApplicationController
    def create
        admin = Admin.find_by(name: params[:name])
        if admin&.authenticate(params[:password]) # ぼっち演算子(&.)を使ってエラーの発生を防いでいる
            # session[:member_id] = member.id
            cookies.signed[:admin_id] = { value: admin.id, expires: 900.seconds.from_now } # 15分に変更 
            redirect_to :admin_root
        else
            flash.alert = "名前とパスワードが一致しません"
            redirect_to "/admin_login"
        end
    end
  
    def destroy
        # session.delete(:member_id)
        cookies.delete(:admin_id)
        redirect_to :root
    end
end
  
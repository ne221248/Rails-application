class Admin::SessionsController < Admin::Base
    def create
        admin = Admin.find_by(name: params[:name])
        if admin&.authenticate(params[:password]) # ぼっち演算子(&.)を使ってエラーの発生を防いでいる
            # session[:member_id] = member.id
            cookies.signed[:admin_id] = { value: admin.id, expires: 900.seconds.from_now } # 15分に変更 
        else
            flash.alert = "名前とパスワードが一致しません"
        end
        redirect_to :admin_root
    end
  
    def destroy
        # session.delete(:member_id)
        cookies.delete(:admin_id)
        redirect_to :root
    end
end
  
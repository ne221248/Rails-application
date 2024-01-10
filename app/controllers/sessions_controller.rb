class SessionsController < ApplicationController
    def create
        member = Member.find_by(name: params[:name])
        if member&.authenticate(params[:password]) # ぼっち演算子(&.)を使ってエラーの発生を防いでいる
            # session[:member_id] = member.id
            cookies.signed[:member_id] = { value: member.id, expires: 900.seconds.from_now } # 15分に変更 
        else
            flash.alert = "名前とパスワードが一致しません"
        end
        redirect_to :root
    end
  
    def destroy
        # session.delete(:member_id)
        cookies.delete(:member_id)
        redirect_to :root
    end
end
  
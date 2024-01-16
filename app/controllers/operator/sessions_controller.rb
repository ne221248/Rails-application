class Operator::SessionsController < ApplicationController
    def create
        operator = Operator.find_by(name: params[:name])
        if operator&.authenticate(params[:password]) # ぼっち演算子(&.)を使ってエラーの発生を防いでいる
            # session[:member_id] = member.id
            cookies.signed[:operator_id] = { value: operator.id, expires: 900.seconds.from_now } # 15分に変更 
            redirect_to :operator_root
        else
            flash.alert = "名前とパスワードが一致しません"
            redirect_to "operator_login"
        end
    end
  
    def destroy
        # session.delete(:member_id)
        cookies.delete(:operator_id)
        redirect_to :root
    end
end
  
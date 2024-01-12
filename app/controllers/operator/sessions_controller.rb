class Operator::SessionsController < Operator::Base
    def create
        operator = Operator.find_by(name: params[:name])
        if admin&.authenticate(params[:password]) # ぼっち演算子(&.)を使ってエラーの発生を防いでいる
            # session[:member_id] = member.id
            cookies.signed[:operator_id] = { value: operator.id, expires: 900.seconds.from_now } # 15分に変更 
        else
            flash.alert = "名前とパスワードが一致しません"
        end
        redirect_to :operator_root
    end
  
    def destroy
        # session.delete(:member_id)
        cookies.delete(:operator_id)
        redirect_to :operator_root
    end
end
  
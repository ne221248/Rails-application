class AccountsController < ApplicationController
  before_action :login_required, except: [:new, :create]

  def show
    @member = current_member
  end

  def edit
    @member = current_member
  end

  def new # 新規作成フォーム
    @member = Member.new
  end

  def create
    @member = Member.new(params[:account]) # newメソッドでフォームから送られてきたパラメータを使ってモデルオブジェクトを作成
    if @member.save  # 保存に成功したらtrueが返ってくる
      Cart.create(member_id: @member.id)
      redirect_to :root, notice: "会員を登録しました。"
    else
      render "new"
    end
  end

  def update
    @member = current_member
    @member.assign_attributes(params[:account])
    if @member.save
      redirect_to :account, notice: "アカウント情報を更新しました。"
    else
      render "edit"
    end
  end

  def destroy
    @member = current_member
    @member.destroy
    redirect_to :root, notice: "ユーザを削除しました"
  end
end

class Admin::MembersController < Admin::Base

    def index #ユーザ一覧表示
        @members = Member.order("id")
    end

    def show #ユーザ詳細表示
        @member = Member.find_by(id: params[:id])
    end

    def edit 
        @member = Member.find_by(id: params[:id])
    end

    def update 
        @member = Member.find_by(id: params[:id])
        @member.assign_attributes(params[:member])
        if @member.save
            redirect_to [:admin, @member], notice: "ユーザの情報を更新しました"
        else
            render "edit"
        end
    end

    def new 
        @member = Member.new
    end

    def create
        @member = Member.new(params[:member])
        if @member.save
            redirect_to [:admin, @member], notice: "ユーザの情報を更新しました"
        else
            render "edit"
        end
    end

    def destroy
        @member = Member.find_by(id: params[:id])
        @member.destroy
        redirect_to [:admin, @member], notice: "ユーザを削除しました"
    end

end
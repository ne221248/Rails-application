class Admin::PartsController < Admin::Base

    def index #パーツ一覧表示
        @parts = Part.order("id")
    end

    def show #パーツ詳細表示
        @part = Part.find_by(id: params[:id])
    end

    def search
        @parts = Part.serch(params[:q], params[:u])
        render "index"
    end

    def edit #パーツの変更
        @part = Part.find_by(id: params[:id])
    end

    def update #パーツの更新
        @part = Part.find_by(id: params[:id])
        @part.assign_attributes(params[:part])
        if @part.save
            redirect_to [:admin, @part], notice: "パーツの情報を更新しました"
        else
            render "edit"
        end
    end

    def new #パーツの新規作成
        @part = Part.new
    end

    def create
        @part = Part.new(params[:part])
        if @part.save
            redirect_to [:admin, @part], notice: "パーツを作成しました"
        else
            render "new"
        end
    end

    def destroy
        @part = Part.find_by(id: params[:id])
        @part.destroy
        redirect_to [:admin, @part], notice: "パーツを削除しました"
    end

end

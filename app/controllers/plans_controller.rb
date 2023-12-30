class PlansController < ApplicationController

    def index #プラン一覧表示
        @plans = Plan.order(price: :asc).all #金額順に並び替え
    end

    def show #プラン詳細表示
    end

    def search
    end

    #以下、管理者のみ権限を所有する

    def edit #プランの変更
    end

    def update #プランの更新
    end

    def new #プランの新規作成
    end

    def create
    end

    def destroy
    end

end

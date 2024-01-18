class Admin::PlansController < Admin::Base

    def index #プラン一覧表示
        @plans = Plan.order("id") 
        @cpu_names = Part.joins(:part_type).where(part_types: { kind: 'CPU' }).pluck(:name)
        @cpu_names.unshift("指定なし")
        @gpu_names = Part.joins(:part_type).where(part_types: { kind: 'GPU' }).pluck(:name)
        @gpu_names.unshift("指定なし")
    end

    def show #プラン詳細表示
        @plan = Plan.find_by(id: params[:id])
        @parts = @plan.parts
    end

    def search
        @plans = Plan.search(params[:query1], params[:query2], params[:query3])
        @cpu_names = Part.joins(:part_type).where(part_types: { kind: 'CPU' }).pluck(:name)
        @cpu_names.unshift("指定なし")
        @gpu_names = Part.joins(:part_type).where(part_types: { kind: 'GPU' }).pluck(:name)
        @gpu_names.unshift("指定なし")
        render "index"
    end

    #以下、管理者のみ権限を所有する

    def edit #プランの変更
        @plan = Plan.find_by(id: params[:id])
        @parts = @plan.parts
    end

    def update #プランの更新(PartPlanクラスについてもやるべき)
        @plan = Plan.find_by(id: params[:id])
        @plan.assign_attributes(params[:plan])
        if @plan.save
            redirect_to [:admin, @plan], notice: "プランの情報を更新しました"
        else
            render "edit"
        end
    end

    def new #プランの新規作成
        @plan = Plan.new
    end

    def create
        @plan = Plan.new(params[:plan])
       
        cpu = Part.find(params[:plan][:cpu]) if params[:plan][:cpu].present?
        if cpu.present?
            @plan.parts << cpu
        end
 
 
        gpu = Part.find(params[:plan][:gpu]) if params[:plan][:gpu].present?
        if gpu.present?
            @plan.parts << gpu
        end
 
 
        os = Part.find(params[:plan][:os]) if params[:plan][:os].present?
        if os.present?
            @plan.parts << os
        end
 
 
        motherboard = Part.find(params[:plan][:motherboard]) if params[:plan][:motherboard].present?
        if motherboard.present?
            @plan.parts << motherboard
        end
 
 
        ram = Part.find(params[:plan][:ram]) if params[:plan][:ram].present?
        if ram.present?
            @plan.parts << ram
        end
 
 
        storage = Part.find(params[:plan][:storage]) if params[:plan][:storage].present?
        if storage.present?
            @plan.parts << storage
        end
 
 
        power = Part.find(params[:plan][:power]) if params[:plan][:power].present?
        if power.present?
            @plan.parts << power
        end
 
 
        box =  Part.find(params[:plan][:box]) if params[:plan][:box].present?
        if box.present?
            @plan.parts << box
        end
 
 
        cool = Part.find(params[:plan][:cool]) if params[:plan][:cool].present?
        if cool.present?
            @plan.parts << cool
        end
 
 
        drive = Part.find(params[:plan][:drive]) if params[:plan][:drive].present?
        if drive.present?
            @plan.parts << drive
        end
 
 
        @parts = [cpu,gpu,os,motherboard,ram,storage,power,box,cool,drive]
        @datas = [@cpu,@gpu,@os,@motherboard,@ram,@storage,@power,@box,@cool,@drive]
 
 
        sum = 0
        @parts.each do |part|
            if part.present?
                sum += part.price.to_i
            end
        end
       
        @plan.price = sum
        @plan.sale = false
 
        if @plan.save
            redirect_to [:admin, @plan], notice: "プランを登録しました。"
        else
          @part_types = PartType.all
          render "new"
        end
    end 

    def destroy
        @plan = Plan.find_by(id: params[:id])
        @plan.destroy
        redirect_to [:admin, @plan], notice: "プランを削除しました"
    end

end

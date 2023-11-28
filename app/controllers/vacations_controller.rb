class VacationsController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create]
    def top
      
    end
    def index
      @vacations = Vacation.all
    search = params[:search]
    @vacations = @vacations.joins(:user).where("name LIKE ?", "%#{search}%") if search.present?
    @vacations = @vacations.page(params[:page]).per(8)
    end
       
    
    
      def new
        @vacation = Vacation.new
      end
    
      def create
        @vacation = Vacation.new(vacation_params)
        @vacation.user_id = current_user.id
      
        # もし画像がアップロードされていない場合
        if params[:vacation][:image].blank?
          # デフォルト画像のパスを指定
          vacation.image = ActionController::Base.helpers.asset_path('default_image.jpg')
        end
      
        if @vacation.save
          redirect_to vacations_path, notice: '投稿が成功しました。'
        else
          render :new
        end
      end
    
      def show
        @vacation = Vacation.find(params[:id])
      end
    
      def edit
        @vacation = Vacation.find(params[:id])
      end
    
      def update
        vacation = Vacation.find(params[:id])
        if vacation.update(vacation_params)
          redirect_to :action => "show", :id => vacation.id
        else
          redirect_to :action => "new"
        end
      end
    
      
      def destroy
        vacation = Vacation.find(params[:id])
        vacation.destroy
        redirect_to action: :index
      end
    
    
      private
      def vacation_params
        params.require(:vacation).permit(:name, :date, :price, :place, :people, :image, :other_attributes, :overall, :review)
      end
end
